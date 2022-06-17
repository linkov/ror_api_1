class CreateQuestionLinks < ActiveRecord::Migration
  def change
    create_table :question_links do |t|
      t.text :url
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
