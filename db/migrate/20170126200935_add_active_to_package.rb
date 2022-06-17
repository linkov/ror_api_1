class AddActiveToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :active, :boolean, default: false
  end
end
