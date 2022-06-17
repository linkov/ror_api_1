class AddDefaultToImpact < ActiveRecord::Migration
  def change
    change_column_default :suggestions, :negative_impact, 0
  end
end
