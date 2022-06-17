class AddIsVisibleToWorks < ActiveRecord::Migration
  def change
    add_column :works, :is_visible, :boolean,:default => true
  end
end
