class CreateParentArtCategories < ActiveRecord::Migration
  def change
    create_table :parent_art_categories do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
