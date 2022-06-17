class CreateBackrates < ActiveRecord::Migration
  def change
    create_table :backrates do |t|
      t.references :user, index: true, foreign_key: true
      t.references :work, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.integer :score

      t.timestamps null: false
    end
  end
end
