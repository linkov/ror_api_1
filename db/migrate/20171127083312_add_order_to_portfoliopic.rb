class AddOrderToPortfoliopic < ActiveRecord::Migration
  def change
    add_column :portfoliopics, :order, :integer
  end
end
