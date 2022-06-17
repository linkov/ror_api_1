class AddSuggestionChoiceToRating < ActiveRecord::Migration
  def change
    add_reference :ratings, :suggestion_choice, index: true, foreign_key: true
  end
end
