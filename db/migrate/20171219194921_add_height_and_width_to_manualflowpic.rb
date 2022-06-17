class AddHeightAndWidthToManualflowpic < ActiveRecord::Migration
  def change
    add_column :manualflowpics, :height, :integer
    add_column :manualflowpics, :width, :integer
  end
end
