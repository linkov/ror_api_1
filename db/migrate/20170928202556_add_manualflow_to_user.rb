class AddManualflowToUser < ActiveRecord::Migration
  def change
    add_column :users, :manualflow, :boolean, :default => false
  end
end
