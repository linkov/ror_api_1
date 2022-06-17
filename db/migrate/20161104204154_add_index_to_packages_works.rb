class AddIndexToPackagesWorks < ActiveRecord::Migration
  def change
    add_index :packages_works, [:package_id, :work_id]
  end
end
