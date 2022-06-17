class AddQuestionReferencesToRating < ActiveRecord::Migration
  def change
    add_reference :ratings, :question, index: true, foreign_key: true
  end
end
