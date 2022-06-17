class CreateSuggestionWordChoices < ActiveRecord::Migration
  def change
    create_table :suggestion_word_choices do |t|
      t.references :suggestion_word, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :work, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
