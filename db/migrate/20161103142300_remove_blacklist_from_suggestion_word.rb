class RemoveBlacklistFromSuggestionWord < ActiveRecord::Migration
  def change
    remove_column :suggestion_words, :blacklist, :boolean
  end
end
