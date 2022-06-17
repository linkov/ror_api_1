class AddMaxTaggitatorWordsToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :max_taggitator_words, :integer, :default => 1
  end
end
