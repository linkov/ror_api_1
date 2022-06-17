class AddTempuidToUser < ActiveRecord::Migration
  def change
    add_column :users, :temp_uid, :string
  end
end
