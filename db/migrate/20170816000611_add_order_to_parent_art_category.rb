class AddOrderToParentArtCategory < ActiveRecord::Migration
  def change
    add_column :parent_art_categories, :order, :integer
  end
end
