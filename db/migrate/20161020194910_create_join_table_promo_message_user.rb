class CreateJoinTablePromoMessageUser < ActiveRecord::Migration
  def change
    create_join_table :promo_messages, :users do |t|
      # t.index [:promo_message_id, :user_id]
      # t.index [:user_id, :promo_message_id]
    end
  end
end
