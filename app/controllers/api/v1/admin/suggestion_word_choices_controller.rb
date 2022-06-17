class Api::V1::Admin::SuggestionWordChoicesController < Api::ApiController
  # before_action :authenticate_user!


  def show
    render json: SuggestionWordChoice.find(params[:id])
  end


  def index

    if params[:question_id]


      if params[:workfilter] && params[:workfilter].length > 0
        @suggestions = SuggestionWordChoice.where(:question_id => params[:question_id],:work_id =>  params[:workfilter])

      else
        @suggestions = SuggestionWordChoice.where(:question_id => params[:question_id],:work_id => current_user.works.pluck(:id))

      end

    else
      @suggestions = SuggestionWordChoice.where(:user => current_user)
    end

    render json:@suggestions
  end


  def create

    suggestionChoice = SuggestionWordChoice.where(:work_id => suggestion_word_choice_params[:work_id],:user_id => User.where(:uid => suggestion_word_choice_params[:uid]).first.id, :question_id => suggestion_word_choice_params[:question_id]).first
    if suggestionChoice
      shouldSaveIncrementedChoiceCount = false
    else
      shouldSaveIncrementedChoiceCount = true
      suggestionChoice = SuggestionWordChoice.new(:work_id => suggestion_word_choice_params[:work_id],:user_id => User.where(:uid => suggestion_word_choice_params[:uid]).first.id,:question_id =>  suggestion_word_choice_params[:question_id])
    end

    suggestionChoice.suggestion_word = SuggestionWord.where(:id => suggestion_word_choice_params[:suggestion_word_id]).first

    suggestionChoiceCount = SuggestionWordChoiceCount.where(:suggestion_word_id => suggestion_word_choice_params[:suggestion_word_id],:work_id =>  suggestion_word_choice_params[:work_id], :question_id => suggestion_word_choice_params[:question_id]).first

    if suggestionChoiceCount


      count = suggestionChoiceCount.count
      count += 1
      if shouldSaveIncrementedChoiceCount
        suggestionChoiceCount.count = count
      end



    else
      count = 1;
      suggestionChoiceCount = SuggestionWordChoiceCount.new(:work_id => suggestion_word_choice_params[:work_id],:question_id =>  suggestion_word_choice_params[:question_id], :suggestion_word_id => suggestion_word_choice_params[:suggestion_word_id], :count => count)

    end


    suggestionChoiceCount.save
    suggestionChoice.save

    connected_rating = Rating.new(:suggestion_word_choice => suggestionChoice , :author => current_user, :question_id => suggestion_word_choice_params[:question_id], :work_id =>  suggestion_word_choice_params[:work_id], :score => 50 )
    work = Work.find(suggestion_word_choice_params[:work_id])
    work.norates = false
    work.save
    connected_rating.save()

    render json:suggestionChoice, serializer: Api::V1::SuggestionWordChoiceSerializer, :root => 'suggestion_word_choice'


      # render json:{'errors':[error]}, status: 400




  end

  private
  def suggestion_word_choice_params
    params.require(:suggestion_word_choice).permit!
  end

end
