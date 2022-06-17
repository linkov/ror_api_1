class AddNegativeImpactToSuggestion < ActiveRecord::Migration
  def change
    add_column :suggestions, :negative_impact, :integer
  end
end
