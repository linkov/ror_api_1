class CreateSuggestionChoices < ActiveRecord::Migration
  def change
    create_table :suggestion_choices do |t|
      t.references :user, index: true, foreign_key: true
      t.references :work, index: true, foreign_key: true
      t.references :suggestion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
