class AddPicturesToWorks < ActiveRecord::Migration
  def change
    add_column :works, :pictures, :text
  end
end
