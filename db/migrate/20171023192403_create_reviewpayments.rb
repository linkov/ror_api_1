class CreateReviewpayments < ActiveRecord::Migration
  def change
    create_table :reviewpayments do |t|
      t.references :user, index: true, foreign_key: true
      t.float :amount
      t.references :work, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
