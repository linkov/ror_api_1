class AddTempPictureToWork < ActiveRecord::Migration
  def change
    add_column :works, :picture_tmp, :string
  end
end
