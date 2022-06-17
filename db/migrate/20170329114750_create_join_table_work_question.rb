class CreateJoinTableWorkQuestion < ActiveRecord::Migration
  def change
    create_join_table :works, :questions do |t|
      # t.index [:work_id, :question_id]
      # t.index [:question_id, :work_id]
    end
  end
end
