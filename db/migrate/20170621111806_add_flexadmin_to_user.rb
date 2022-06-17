class AddFlexadminToUser < ActiveRecord::Migration
  def change
    add_column :users, :flexadmin, :boolean, :default => false
  end
end
