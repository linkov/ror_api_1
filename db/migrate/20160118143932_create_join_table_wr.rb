class CreateJoinTableWr < ActiveRecord::Migration
  def change
    create_join_table :works, :rating_types do |t|
       t.index [:work_id, :rating_type_id]
       t.index [:rating_type_id, :work_id]
    end
  end
end
