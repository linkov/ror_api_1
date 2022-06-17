class AddOrderToTutorialStep < ActiveRecord::Migration
  def change
    add_column :tutorial_steps, :order, :integer
  end
end
