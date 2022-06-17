class CreateExpertises < ActiveRecord::Migration
  def change
    create_table :expertises do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
