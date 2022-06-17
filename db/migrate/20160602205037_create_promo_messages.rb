class CreatePromoMessages < ActiveRecord::Migration
  def change
    create_table :promo_messages do |t|
      t.integer :target_rate_count

      t.timestamps null: false
    end
  end
end
