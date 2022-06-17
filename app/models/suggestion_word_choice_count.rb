class SuggestionWordChoiceCount < ActiveRecord::Base
  belongs_to :suggestion_word
  belongs_to :question
  belongs_to :work
end
