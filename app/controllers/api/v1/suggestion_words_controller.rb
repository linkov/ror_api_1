class Api::V1::SuggestionWordsController < Api::ApiController
  # before_action :authenticate_user!


  def show
    render json: SuggestionWord.find(params[:id])
  end


  def index
    @suggestions = SuggestionWord.all
    render json:@suggestions
  end


  def create

    word =  suggestion_params[:word]
    word.downcase!

    is_in_DB = SuggestionWord.where(:word => word).count != 0
    is_in_blacklist = SuggestionWordBlackListItem.where(:word =>word).count != 0


    if is_in_blacklist
      error = {
          code: 'blacklist',
          error: 'This word is in black list',
          status: 400
      }

      render json:{'errors':[error]}, status: 400 and return

    end

    if is_in_DB
      suggestionWord = SuggestionWord.where(:word => word).first
    else
      suggestionWord = SuggestionWord.new(suggestion_params)
      suggestionWord.save!

    end
    render json:suggestionWord



  end

  private
  def suggestion_params
    params.require(:suggestion_word).permit!
  end

end