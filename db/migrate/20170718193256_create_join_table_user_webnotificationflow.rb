class CreateJoinTableUserWebnotificationflow < ActiveRecord::Migration
  def change
    create_join_table :users, :webnotificationflows do |t|
      # t.index [:user_id, :webnotificationflow_id]
      # t.index [:webnotificationflow_id, :user_id]
    end
  end
end
