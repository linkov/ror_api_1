class AddPicturesCountToWork < ActiveRecord::Migration
  def change
    add_column :works, :pictures_count, :integer
  end
end
