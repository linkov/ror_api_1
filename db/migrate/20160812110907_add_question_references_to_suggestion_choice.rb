class AddQuestionReferencesToSuggestionChoice < ActiveRecord::Migration
  def change
    add_reference :suggestion_choices, :question, foreign_key: true
  end
end
