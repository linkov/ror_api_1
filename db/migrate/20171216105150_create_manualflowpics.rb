class CreateManualflowpics < ActiveRecord::Migration
  def change
    create_table :manualflowpics do |t|
      t.integer :order, :default => 0
      t.references :work, index: true, foreign_key: true
      t.string :url
      t.timestamps null: false
    end
  end
end
