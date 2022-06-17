class RemoveToOneFromArtCategoryWorkCategory < ActiveRecord::Migration
  def change
    remove_foreign_key :art_categories, :work_categories
    remove_reference :art_categories, :work_category, references: :work_categories
  end
end
