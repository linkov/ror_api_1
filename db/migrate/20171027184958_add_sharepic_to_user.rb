class AddSharepicToUser < ActiveRecord::Migration
  def change
    add_column :users, :sharepic, :string
  end
end
