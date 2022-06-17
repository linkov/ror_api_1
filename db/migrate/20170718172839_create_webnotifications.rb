class CreateWebnotifications < ActiveRecord::Migration
  def change
    create_table :webnotifications do |t|
      t.string :title
      t.text :detail
      t.string :image
      t.references :webnotificationflow, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
