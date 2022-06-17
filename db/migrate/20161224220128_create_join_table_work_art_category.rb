class CreateJoinTableWorkArtCategory < ActiveRecord::Migration
  def change
    create_join_table :art_categories, :works do |t|
      # t.index [:promo_message_id, :user_id]
      # t.index [:user_id, :promo_message_id]
    end
  end
end
