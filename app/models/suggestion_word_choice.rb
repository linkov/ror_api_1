class SuggestionWordChoice < ActiveRecord::Base
  belongs_to :suggestion_word
  belongs_to :user
  belongs_to :work
  belongs_to :question
  has_one :rating, dependent: :destroy
end
