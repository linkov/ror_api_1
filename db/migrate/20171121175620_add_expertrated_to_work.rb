class AddExpertratedToWork < ActiveRecord::Migration
  def change
    add_column :works, :expertrated, :bool, :default => false
  end
end
