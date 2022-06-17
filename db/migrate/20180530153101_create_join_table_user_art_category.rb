class CreateJoinTableUserArtCategory < ActiveRecord::Migration
  def change
    create_join_table :users, :art_categories do |t|
      # t.index [:user_id, :art_category_id]
      # t.index [:art_category_id, :user_id]
    end
  end
end
