class AddCharTranslationsToQuestion < ActiveRecord::Migration
  def change
    Question.add_translation_fields! low: :string, mid: :string, high: :string
  end
end
