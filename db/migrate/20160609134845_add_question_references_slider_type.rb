  class AddQuestionReferencesSliderType < ActiveRecord::Migration
  def change
    add_reference :questions, :slider_type, foreign_key: true
  end
end
