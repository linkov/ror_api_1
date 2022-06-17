class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :rating_types, :work_categories do |t|
       t.index([:rating_type_id,:work_category_id], unique:true, name:'rating_wcat_index')
       t.index([:work_category_id, :rating_type_id], unique:true, name:'wcat_rating_index')
    end
  end
end
