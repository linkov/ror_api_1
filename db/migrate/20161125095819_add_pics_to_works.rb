class AddPicsToWorks < ActiveRecord::Migration
  def change
    add_column :works, :pics, :string
  end
end
