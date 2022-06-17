class AddFreereviewToUser < ActiveRecord::Migration
  def change
    add_column :users, :freereview, :boolean, :default => false
  end
end
