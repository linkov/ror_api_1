class AddOrderToWebnotification < ActiveRecord::Migration
  def change
    add_column :webnotifications, :order, :integer, :default => 0
  end
end
