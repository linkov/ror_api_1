class AddAncestryToRatingTypes < ActiveRecord::Migration
  def change
    add_column :rating_types, :ancestry, :string
    add_index :rating_types, :ancestry
  end

end

