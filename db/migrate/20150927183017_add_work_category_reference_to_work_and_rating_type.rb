class AddWorkCategoryReferenceToWorkAndRatingType < ActiveRecord::Migration
  def change
    add_reference :works, :work_category, index: true, foreign_key: true
    add_reference :rating_types, :work_category, index: true, foreign_key: true
  end
end
