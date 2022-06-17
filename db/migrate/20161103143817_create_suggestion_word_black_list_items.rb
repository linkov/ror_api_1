class CreateSuggestionWordBlackListItems < ActiveRecord::Migration
  def change
    create_table :suggestion_word_black_list_items do |t|
      t.string :word
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
