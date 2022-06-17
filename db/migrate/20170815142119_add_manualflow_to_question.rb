class AddManualflowToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :Manualflow, :boolean, default: false
  end
end
