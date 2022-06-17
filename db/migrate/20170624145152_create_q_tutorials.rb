class CreateQTutorials < ActiveRecord::Migration
  def change
    create_table :q_tutorials do |t|
      t.references :question, index: true, foreign_key: true
      t.string :link

      t.timestamps null: false
    end
  end
end
