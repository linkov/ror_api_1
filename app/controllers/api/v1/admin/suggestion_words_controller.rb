class Api::V1::Admin::SuggestionWordsController < Api::ApiController
  # before_action :authenticate_user!


  def show
    render json: SuggestionWord.find(params[:id]), serializer: Api::V1::SuggestionWordSerializer, :root => 'suggestion_word'
  end


  def index
    @suggestions = SuggestionWord.all
    render json:@suggestions, each_serializer: Api::V1::SuggestionWordSerializer
  end


  def create

    word =  suggestion_params[:word]
    word.downcase!

    is_in_DB = SuggestionWord.where(:word => word).count != 0


    if is_in_DB
      suggestionWord = SuggestionWord.where(:word => word).first
    else
      suggestionWord = SuggestionWord.new(suggestion_params)
      suggestionWord.save!

    end
    render json:suggestionWord, serializer: Api::V1::SuggestionWordSerializer, :root => 'suggestion_word'



  end

  private
  def suggestion_params
    params.require(:suggestion_word).permit!
  end

end
