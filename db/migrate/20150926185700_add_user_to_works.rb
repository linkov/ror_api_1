class AddUserToWorks < ActiveRecord::Migration
  def change
    add_reference :works, :user, index: true, foreign_key: true
    add_index :works, [:user_id, :created_at]
  end
end
