class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :title
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
