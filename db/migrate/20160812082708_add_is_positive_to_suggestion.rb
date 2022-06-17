class AddIsPositiveToSuggestion < ActiveRecord::Migration
  def change
    add_column :suggestions, :is_positive, :boolean, default: false
  end
end
