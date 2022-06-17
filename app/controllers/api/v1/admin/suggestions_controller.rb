class Api::V1::Admin::SuggestionsController < Api::ApiController
  # before_action :authenticate_user!

  def destroy
    rec = Suggestion.find(params[:id])
    rec.destroy
    render json: rec
  end


  def create
    suggest = Suggestion.create(suggestion_params)
    render json:suggest, serializer: Api::V1::SuggestionAdminSerializer, :root => 'suggestion'
  end


  def update
    suggest = Suggestion.find(params[:id])
    suggest.update(suggestion_params)
    render json:suggest, serializer: Api::V1::SuggestionAdminSerializer, :root => 'suggestion'
  end

  def show
    @suggest = Suggestion.find(params[:id])
    render json:@suggest, serializer: Api::V1::SuggestionAdminSerializer, :root => 'suggestion'
  end


  def index

    if params[:question_id]
      @suggestions = Suggestion.where(:question_id => params[:question_id])
    else
      @suggestions = Suggestion.all
    end

    render json:@suggestions, each_serializer: Api::V1::SuggestionAdminSerializer


  end


  def suggestion_params
    params.require(:suggestion).permit!
  end

end
