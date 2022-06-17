class CreatePortfoliopics < ActiveRecord::Migration
  def change
    create_table :portfoliopics do |t|
      t.string :picture

      t.timestamps null: false
    end
  end
end
