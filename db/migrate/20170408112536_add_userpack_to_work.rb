class AddUserpackToWork < ActiveRecord::Migration
  def change
    add_column :works, :userpack, :boolean, :default => false
  end
end
