class CreateSuggestionWords < ActiveRecord::Migration
  def change
    create_table :suggestion_words do |t|
      t.string :word
      t.boolean :blacklist, default: false

      t.timestamps null: false
    end
  end
end
