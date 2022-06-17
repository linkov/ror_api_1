class AddManualflowToWork < ActiveRecord::Migration
  def change
    add_column :works, :manualflow, :boolean, :default => false
  end
end
