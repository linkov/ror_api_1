class AddSharedpackToWork < ActiveRecord::Migration
  def change
    add_column :works, :sharedpack, :boolean, :default => true
  end
end
