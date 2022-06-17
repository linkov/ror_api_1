class AddWorkCategoryToArtCategory < ActiveRecord::Migration
  def change
    add_reference :art_categories, :work_category, index: true, foreign_key: true
  end
end
