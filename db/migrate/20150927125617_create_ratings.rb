class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.references :work, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
