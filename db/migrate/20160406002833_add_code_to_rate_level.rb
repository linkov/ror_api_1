class AddCodeToRateLevel < ActiveRecord::Migration
  def change
    add_column :rate_levels, :code, :string
  end
end
