class AddSliderWordingsToQuestion < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        Question.add_translation_fields! slider_wording_10: :string
        Question.add_translation_fields! slider_wording_20: :string
        Question.add_translation_fields! slider_wording_30: :string
        Question.add_translation_fields! slider_wording_40: :string
        Question.add_translation_fields! slider_wording_50: :string
        Question.add_translation_fields! slider_wording_60: :string
        Question.add_translation_fields! slider_wording_70: :string
        Question.add_translation_fields! slider_wording_80: :string
        Question.add_translation_fields! slider_wording_90: :string
        Question.add_translation_fields! slider_wording_100: :string
      end

      dir.down do
        remove_column :question_translations, :slider_wording_10
        remove_column :question_translations, :slider_wording_20
        remove_column :question_translations, :slider_wording_30
        remove_column :question_translations, :slider_wording_40
        remove_column :question_translations, :slider_wording_50
        remove_column :question_translations, :slider_wording_60
        remove_column :question_translations, :slider_wording_70
        remove_column :question_translations, :slider_wording_80
        remove_column :question_translations, :slider_wording_90
        remove_column :question_translations, :slider_wording_100
      end
    end
  end
end
