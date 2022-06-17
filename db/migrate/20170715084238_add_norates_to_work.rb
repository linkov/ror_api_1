class AddNoratesToWork < ActiveRecord::Migration
  def change
    add_column :works, :norates, :boolean, default: true
  end
end
