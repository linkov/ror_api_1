class AddPublicToWork < ActiveRecord::Migration
  def change
    add_column :works, :public, :boolean, :default => false
  end
end
