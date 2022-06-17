class ChangePicCountConstaints < ActiveRecord::Migration
  def change
    change_column_null :works, :pictures_count, false
    change_column_default(:works, :pictures_count, 0)
  end
end
