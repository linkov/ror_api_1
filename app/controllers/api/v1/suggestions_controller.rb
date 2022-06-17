class Api::V1::SuggestionsController < Api::ApiController
  # before_action :authenticate_user!


  def show
    render json: Suggestion.find(params[:id])
  end


  def index

    if params[:question_id]
      @suggestions = Suggestion.where(:question_id => params[:question_id])
      render json:@suggestions
    else
      @suggestions = Suggestion.all
      render json:@suggestions
    end


  end

end
