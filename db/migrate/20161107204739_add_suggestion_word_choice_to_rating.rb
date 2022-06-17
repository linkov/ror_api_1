class AddSuggestionWordChoiceToRating < ActiveRecord::Migration
  def change
    add_reference :ratings, :suggestion_word_choice, index: true, foreign_key: true
  end
end
