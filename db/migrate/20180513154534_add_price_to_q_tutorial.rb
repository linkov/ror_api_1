class AddPriceToQTutorial < ActiveRecord::Migration
  def change
    add_column :q_tutorials, :price, :integer, :default => 0
  end
end
