class CreateJoinTablePackageWork < ActiveRecord::Migration
  def change
    create_join_table :packages, :works do |t|
      # t.index [:package_id, :work_id]
      # t.index [:work_id, :package_id]
    end
  end
end
