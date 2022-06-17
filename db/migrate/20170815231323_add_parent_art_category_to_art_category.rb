class AddParentArtCategoryToArtCategory < ActiveRecord::Migration
  def change
    add_reference :art_categories, :parent_art_category, index: true, foreign_key: true
  end
end
