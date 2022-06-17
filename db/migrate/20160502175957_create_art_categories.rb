class CreateArtCategories < ActiveRecord::Migration
  def change
    create_table :art_categories do |t|
      t.string :title
      t.string :picture

      t.timestamps null: false
    end
  end
end
