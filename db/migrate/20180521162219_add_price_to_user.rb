class AddPriceToUser < ActiveRecord::Migration
  def change
    add_column :users, :price, :float, :default => 19.99
  end
end
