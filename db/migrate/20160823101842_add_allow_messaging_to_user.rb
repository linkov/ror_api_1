class AddAllowMessagingToUser < ActiveRecord::Migration
  def change
    add_column :users, :allow_messaging, :boolean, :default => true
  end
end
