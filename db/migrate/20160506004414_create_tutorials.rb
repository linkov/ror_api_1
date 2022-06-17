class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.integer :rating_type_id

      t.timestamps null: false
    end
  end
end
