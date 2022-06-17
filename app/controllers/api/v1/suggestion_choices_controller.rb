class Api::V1::SuggestionChoicesController < Api::ApiController
  # before_action :authenticate_user!

  def suggests

    work = Work.where(:id => params[:work_id]).first
    question = Question.where(:id => params[:question_id]).first
    suggestion_choices = SuggestionChoice.where(:question_id => question.id, :work_id => work.id)
    positive_count = suggestion_choices.where(:positive => true).count
    negative_count = suggestion_choices.where(:positive => false).count
    positive_percent = (positive_count.to_f/suggestion_choices.count)*100
    negative_percent = (negative_count.to_f/suggestion_choices.count)*100
    negative_choices = suggestion_choices.where(:positive => false)
    suggestions = Suggestion.where(:question_id => question.id)
    suggestions = suggestions.collect { |r|
      {
          'id':r.id,
          'title': r.title,
          'count': SuggestionChoice.where(:suggestion_id => r.id, :work_id => work.id,:question_id => question.id).count,
       }
    }


    if positive_percent.to_f.nan?
      positive_percent = 0
    end


    if negative_percent.to_f.nan?
      negative_percent = 0
    end


    suggestions = suggestions.sort {|a,b| b[:count] <=> a[:count]}

    render json:{
      positive_count:positive_count.round,
      negative_count:negative_count.round,
      positive_percent:positive_percent.round,
      negative_percent:negative_percent.round,
      suggestions:suggestions

    }


  end

  def show
    render json: SuggestionChoice.find(params[:id])
  end


  def index
    @suggestions = SuggestionChoice.all
    render json:@suggestions
  end


  def create
    user = User.where(:uid => params[:user_id]).first
    work = Work.find(params[:work_id])
    existing_choice_for_question_user_work = SuggestionChoice.where( :question_id => params[:question_id],:work_id => params[:work_id], :user_id => user.id ).first
    if existing_choice_for_question_user_work
      existing_choice_for_question_user_work.destroy
    end
    @choice = SuggestionChoice.new(:positive => params[:positive], :question_id => params[:question_id],:work_id => params[:work_id], :user_id => user.id,:suggestion_id =>params[:suggestion_id])
    if @choice.save
      if @choice.positive

        rate_value = 60

      else

        rate_value = 40

      end

      connected_rating = Rating.new(:suggestion_choice_id => @choice.id , :author => user, :question_id => params[:question_id], :work_id =>  params[:work_id], :score => rate_value )
      connected_rating.save()
      connected_rating.create_activity :create, owner: user, recipient: work.user, params:{type:"choosomatic", score:rate_value,comment:@choice.suggestion.title,question:params[:question_id],work:work.id}
      work.norates = false
      work.save
      render json:@choice
    end
  end

  private
  def choice_params
    params.permit(:question_id, :suggestion_id,:work_id, :user_id, :positive )
  end

end
