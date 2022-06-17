class AddIsActiveToWorks < ActiveRecord::Migration
  def change
    add_column :works, :is_active, :boolean,:default => false
  end
end
