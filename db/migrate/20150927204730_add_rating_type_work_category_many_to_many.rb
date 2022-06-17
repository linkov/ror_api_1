class AddRatingTypeWorkCategoryManyToMany < ActiveRecord::Migration
  def change
    create_table :rating_types_work_categories, :id => false do |t|
      t.references :rating_types, :work_categories
    end
  end
end
