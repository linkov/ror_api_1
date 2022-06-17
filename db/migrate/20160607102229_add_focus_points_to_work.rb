class AddFocusPointsToWork < ActiveRecord::Migration
  def change
    add_column :works, :emo_point, :integer
    add_column :works, :idea_point, :integer
    add_column :works, :tech_point, :integer
  end
end
