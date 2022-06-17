class AddWorkCategoryToPackage < ActiveRecord::Migration
  def change
    add_reference :packages, :work_category, index: true, foreign_key: true
  end
end
