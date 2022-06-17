class RenameManualFlow < ActiveRecord::Migration
  def change
     rename_column :questions, :Manualflow, :manualflow
  end
end
