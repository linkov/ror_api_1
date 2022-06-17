class RenameManualflowpic < ActiveRecord::Migration
  def change
    rename_column :works, :Manualflowpic, :manualflowpic
  end
end
