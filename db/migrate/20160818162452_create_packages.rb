class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.decimal :price, precision: 8, scale: 2
      t.text :description
      t.string :image
      t.string :video

      t.timestamps null: false
    end
  end
end
