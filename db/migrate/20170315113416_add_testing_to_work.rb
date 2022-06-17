class AddTestingToWork < ActiveRecord::Migration
  def change
    add_column :works, :testing, :boolean, :default => false
  end
end
