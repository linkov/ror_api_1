class RemoveIsPositiveFromSuggestion < ActiveRecord::Migration
  def change
    remove_column :suggestions, :is_positive, :boolean
  end
end
