class AddParentIdToRateType < ActiveRecord::Migration
  def change
    add_column :rating_types, :parent_id, :integer
  end
end
