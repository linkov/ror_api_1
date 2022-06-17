class AddCodeToParentArtCategory < ActiveRecord::Migration
  def change
    add_column :parent_art_categories, :code, :string
  end
end
