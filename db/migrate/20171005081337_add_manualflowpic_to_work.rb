class AddManualflowpicToWork < ActiveRecord::Migration
  def change
    add_column :works, :Manualflowpic, :string
  end
end
