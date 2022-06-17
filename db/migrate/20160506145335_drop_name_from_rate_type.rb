class DropNameFromRateType < ActiveRecord::Migration
  def change
    remove_column :rating_types, :name
  end
end
