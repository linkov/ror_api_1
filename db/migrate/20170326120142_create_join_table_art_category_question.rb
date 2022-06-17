class CreateJoinTableArtCategoryQuestion < ActiveRecord::Migration
  def change
    create_join_table :art_categories, :questions do |t|
      # t.index [:art_category_id, :question_id]
      # t.index [:question_id, :art_category_id]
    end
  end
end
