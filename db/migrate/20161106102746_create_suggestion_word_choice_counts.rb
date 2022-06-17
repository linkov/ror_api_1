class CreateSuggestionWordChoiceCounts < ActiveRecord::Migration
  def change
    create_table :suggestion_word_choice_counts do |t|
      t.references :suggestion_word, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.references :work, index: true, foreign_key: true
      t.integer :count

      t.timestamps null: false
    end
  end
end
