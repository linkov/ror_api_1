class CreateJoinTableArtCategoryWorkCategory < ActiveRecord::Migration
  def change
    create_join_table :art_categories, :work_categories do |t|
      # t.index [:art_category_id, :work_category_id]
      # t.index [:work_category_id, :art_category_id]
    end
  end
end
