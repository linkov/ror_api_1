class ChangeL1AverageColumnName < ActiveRecord::Migration
  def change
    remove_column :works, :l1_average
    add_column :works, :average_rating, :integer, :default => 50
  end
end
