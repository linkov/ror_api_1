class AddRelevanceToArtCategoriesQuestions < ActiveRecord::Migration
  def change
    add_column :art_categories_questions, :relevance, :integer, :default => 3
  end
end
