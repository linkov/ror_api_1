class RemoveWorkCategoryReferenceFromRatingTypes < ActiveRecord::Migration
  def change
    remove_reference :rating_types, :work_category, index: true, foreign_key: true
  end
end
