class AddShortbioToUser < ActiveRecord::Migration
  def change
    add_column :users, :shortbio, :text
  end
end
