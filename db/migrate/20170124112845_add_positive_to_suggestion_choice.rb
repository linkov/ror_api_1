class AddPositiveToSuggestionChoice < ActiveRecord::Migration
  def change
    add_column :suggestion_choices, :positive, :boolean, default: false
  end
end
