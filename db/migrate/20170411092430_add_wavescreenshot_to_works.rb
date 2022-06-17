class AddWavescreenshotToWorks < ActiveRecord::Migration
  def change
    add_column :works, :wavescreenshot, :string
  end
end
