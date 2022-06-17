class AddL1AverageToWorks < ActiveRecord::Migration
  def change
    add_column :works, :l1_average, :integer
  end
end
