require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

class Api::V1::RatingsController < Api::ApiController
  # before_action :authenticate_user!

  def show
    render json: Rating.find(params[:id])
  end

  def liverate
    if current_user
      render json:{liverate:current_user.ratecount}
    else
      render json:[]
    end
  end


  def overall_stat_mvp_extended_v2

    wrk = Work.find_by_id(params[:work_id])
    all_ratings = Rating.where(:id => wrk.ratings.collect(&:id))
    all_questions = wrk.questions.where(:manualflow => true,:id => all_ratings.collect(&:question_id))

    mostly_emo_question_cards = []
    mostly_tech_question_cards = []
    mostly_concept_question_cards = []
    mostly_popular_question_cards = []

    all_questions.each do |question|

      rating = Rating.where(:question_id => question.id,:work_id => wrk.id).first
      dict = {question_id:question.id,title:question.mid,order:rating.score,question_title:question.title_en, decimalscore:rating.score/10, score:rating.score,rating_comment:rating.comment}

      if (question.main_root_category_code() == "emotion")
        mostly_emo_question_cards << dict
      end

      if (question.main_root_category_code() == "technique")
        mostly_tech_question_cards << dict
      end

      if (question.main_root_category_code() == "concept")
        mostly_concept_question_cards << dict
      end

      if (question.main_root_category_code() == "popular")
        mostly_popular_question_cards << dict
      end

    end


    render json:{
      emocards:mostly_emo_question_cards.sort_by {|card| card[:order]}.reverse,
      techcards:mostly_tech_question_cards.sort_by {|card| card[:order]}.reverse,
      conceptcards:mostly_concept_question_cards.sort_by {|card| card[:order]}.reverse,
      popularcards:mostly_popular_question_cards.sort_by {|card| card[:order]}.reverse,
    }



  end


  def overall_stat_mvp_extended

      wrk = Work.find_by_id(params[:work_id])
      weekchartdata = []

      all_ratings = Rating.where(:id => wrk.ratings.collect(&:id))
      rcount = all_ratings.count
      average_score =  all_ratings.collect(&:score).sum.to_f/all_ratings.length if all_ratings.length > 0

      choosomatic = SliderType.where(:code => "choosomatic").first
      taggitator = SliderType.where(:code => "taggitator").first
      emo_slider = SliderType.where(:code => "emo").first
      normal_slider = SliderType.where(:code => "normal").first
      non_slider_question_ids = Question.where(:slider_type => [taggitator,choosomatic])

      if rcount != 0
        positive_rates = all_ratings.where(:score => 60..100)
        neutral_rates = all_ratings.where(:score => 41..59)
        negative_rates = all_ratings.where(:score => 1..40)

        positive_feedback = Question.where(:manualflow => true, :id => positive_rates.collect(&:question_id)).where.not(:id => non_slider_question_ids).where(:emocard => false)
        neutral_feedback = Question.where(:manualflow => true, :id => neutral_rates.collect(&:question_id)).where.not(:id => non_slider_question_ids).where(:emocard => false)
        negative_feedback = Question.where(:manualflow => true, :id => negative_rates.collect(&:question_id)).where.not(:id => non_slider_question_ids).where(:emocard => false)


        positive_feedback_and_rates = []
        positive_feedback.each do |feedback|
          dict = {question:feedback,rating:Rating.where(:question_id => feedback.id,:work_id => wrk.id).first}
          positive_feedback_and_rates << dict

        end

        neutral_feedback_and_rates = []
        neutral_feedback.each do |feedback|
          dict = {question:feedback,rating:Rating.where(:question_id => feedback.id,:work_id => wrk.id).first}
          neutral_feedback_and_rates << dict

        end


        negative_feedback_and_rates = []
        negative_feedback.each do |feedback|
          dict = {question:feedback,rating:Rating.where(:question_id => feedback.id,:work_id => wrk.id).first}
          negative_feedback_and_rates << dict

        end


        feedbackgroups = [{data:positive_feedback_and_rates,title:"Great",order:1}, {data:neutral_feedback_and_rates,title:"Good",order:2}, {data:negative_feedback_and_rates,title:"Needs work",order:3}]

      else

        feedbackgroups = []

      end


      wrk = Work.find_by_id(params[:work_id])
      choices = SuggestionWordChoice.where(:work_id => params[:work_id])
      words = SuggestionWord.where(:id => choices.collect(&:suggestion_word_id))
      hasTags = (words.count > 0)

      choosomaticChoices = SuggestionChoice.where(:work_id => params[:work_id])
      hasChoosomatic = (choosomaticChoices.count > 0)



      emocardquestion = Question.where(:emocard => true).first
      emocardrating = Rating.where(:question_id => emocardquestion.id,:work_id => wrk.id).first

      if emocardrating
        emocardscore = emocardrating.score
      else
        emocardscore = 0
      end



      in_payed = Reviewpayment.where(:work_id => wrk.id).count > 0

      render json:{
        payedreview:in_payed,
        hasTags:hasTags,
        hasChoosomatic:hasChoosomatic,
        ratecount:rcount,
        average:average_score,
        feedbackgroups:feedbackgroups,
        emocardscore:emocardscore
      }

  end

  def overall_stats_extended

      wrk = Work.find_by_id(params[:work_id])
      weekchartdata = []

      all_ratings = Rating.where(:id => wrk.ratings.collect(&:id))
      rcount = all_ratings.count
      average_score =  all_ratings.collect(&:score).sum.to_f/all_ratings.length if all_ratings.length > 0

      if rcount != 0
        negative = ( ((all_ratings.where(:score => 1..40).count.to_f)/rcount)*100 ).round
        neutral =  ( ((all_ratings.where(:score => 41..59).count.to_f)/rcount)*100 ).round
        positive = ( ((all_ratings.where(:score => 60..100).count.to_f)/rcount)*100 ).round

        week_rates1 = all_ratings.where(:created_at => (1.weeks.ago..Time.now))
        average_score_week_rates1 =  (week_rates1.collect(&:score).sum.to_f/week_rates1.length).round if week_rates1.length > 0

        week_rates2 = all_ratings.where(:created_at => (2.weeks.ago..1.weeks.ago))
        average_score_week_rates2 =  (week_rates2.collect(&:score).sum.to_f/week_rates2.length).round if week_rates2.length > 0

        week_rates3 = all_ratings.where(:created_at => (3.weeks.ago..2.weeks.ago))
        average_score_week_rates3 =  (week_rates3.collect(&:score).sum.to_f/week_rates3.length).round if week_rates3.length > 0

        week_rates4 = all_ratings.where(:created_at => (4.weeks.ago..3.weeks.ago))
        average_score_week_rates4 =  (week_rates4.collect(&:score).sum.to_f/week_rates4.length).round if week_rates4.length > 0

        weekchartdata = [
          average_score_week_rates4 ? average_score_week_rates4 : 0,
          average_score_week_rates3 ? average_score_week_rates3 : 0,
          average_score_week_rates2 ? average_score_week_rates2 : 0,
          average_score_week_rates1 ? average_score_week_rates1 : 0
        ]


      else
        weekchartdata = [0, 0, 0, 0]
        negative = 0
        neutral = 0
        positive = 0
      end


      distributionchartdata = [positive, neutral, negative]


      render json:{
        ratecount:rcount,
        average:average_score,
        weekchartdata:weekchartdata,
        distributionchartdata:distributionchartdata
      }

  end

  def tags

      wrk = Work.find_by_id(params[:work_id])
      choices = SuggestionWordChoice.where(:question_id =>params[:question_id],:work_id => params[:work_id])
      words = SuggestionWord.where(:id => choices.collect(&:suggestion_word_id))
      tags = words.collect { |r|
        {
            'id':r.id,
            'title': r.word,
            'count': SuggestionWordChoiceCount.where(:suggestion_word_id => r.id,:question_id => params[:question_id]).first.count,
         }
      }


      render json:{tags:tags}

  end

  def overall_pic_stats

    rates_count = TestaworkChoice.where(:picture_id => params[:picture_id]).count
    render json:{ratecount:rates_count}
  end

  def tag_stats
    wrk = Work.find_by_id(params[:work_id])
    question = Question.where(:id => params[:question_id]).first
    suggestion_word = SuggestionWord.where(:id => params[:tag_id]).first
    suggestion_word_choices = SuggestionWordChoice.where(:id => suggestion_word.id)

    ratings = suggestion_word_choices.order(created_at: :desc).collect { |choice|
      {

          'id':choice.id,
          'time': time_ago_in_words(choice.created_at),
          'user_rating': choice.user.score,
       }
    }

    render json:{tag_ratings:ratings}


  end

  def overall_stats

    if params[:question_id]

      wrk = Work.find_by_id(params[:work_id])
      question = Question.where(:id => params[:question_id]).first

      all_ratings = Rating.where(:question_id =>params[:question_id], :id => wrk.ratings.collect(&:id))
      rcount = all_ratings.count
      average_score =  all_ratings.collect(&:score).sum.to_f/all_ratings.length if all_ratings.length > 0
      average_emo_code = 0
      if question.slider_type.code == "emo"
        average_emo_code = all_ratings.collect(&:emocode).sum.to_f/all_ratings.length if all_ratings.length > 0
      end


      ratings = all_ratings.order(created_at: :desc).collect { |rating|
        {

            'id':rating.id,
            'score':rating.score,
            'comment':rating.comment,
            'time': time_ago_in_words(rating.created_at),
            'user_rating': rating.author.score,
            'user_id': rating.author.id,
         }
      }
      rating_groups = ratings.each_slice(1).to_a


      awesome = ( ((all_ratings.where(:score => 75..100).count.to_f)/rcount)*100 ).round
      alright =  ( ((all_ratings.where(:score => 50..74).count.to_f)/rcount)*100 ).round
      well = ( ((all_ratings.where(:score => 25..49).count.to_f)/rcount)*100 ).round
      hmm = ( ((all_ratings.where(:score => 0..24).count.to_f)/rcount)*100 ).round

      itemdistributionchartdata = [awesome,alright,well,hmm]



      render json:{itemdistributionchartdata:itemdistributionchartdata,ratecount:rcount,average:average_score, emocode:average_emo_code,ratings:ratings,rating_groups:rating_groups}
    else
      wrk = Work.find_by_id(params[:work_id])

      all_ratings = Rating.where(:id => wrk.ratings.collect(&:id))
      rcount = all_ratings.count
      average_score =  all_ratings.collect(&:score).sum.to_f/all_ratings.length if all_ratings.length > 0
      render json:{ratecount:rcount,average:average_score}
    end

  end

  def index

    if params[:current_user]
      if current_user
        render json:Rating.where(:author => User.find_by_email(current_user.email))
      else

        render json:[]
      end

    else
      render json:Rating.where(:author => current_user)
    end


  end

  def create

    if not user_signed_in?
      authenticate_user!
      return
    end



    @work = Work.find params[:rating][:work_id]

    comment =  params[:rating][:comment]
    emocode =  params[:rating][:emocode]
    q_id =  params[:rating][:question_id]
    rating_value =  params[:rating][:score]
    user = User.where(:uid => params[:rating][:author_id]).first


    @newrating =  Rating.create(
        :question_id=>q_id,
        :work => @work,
        :author => user,
        :comment => comment,
        :score => rating_value,
        :emocode => emocode
    )


    @newrating.validate!
    @newrating.errors.full_messages
    @newrating.save!
    @newrating.create_activity :create, owner: user, recipient: @work.user, params:{score:rating_value,comment:comment,question:q_id,work:@work.id}

    @work.norates = false
    @work.save


    render json: @newrating


  end


  def update
    @rating = Rating.find params[:id]
    # @user.update_attributes(user_params)
    if @rating.update(rating_params)
      render json: @rating
    else
      render json: @rating.errors
    end

  end


  private

  def rating_params
    params.require(:rating).permit!
  end

end
