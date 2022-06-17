class RemoveQuestionIdFromSliderType < ActiveRecord::Migration
  def change
    remove_foreign_key :slider_types, :questions
    remove_reference :slider_types, :question, references: :questions

  end
end
