class RenameArtcategoriesquestionsTable < ActiveRecord::Migration
  def change
    rename_table :art_categories_questions, :question_tags
  end
end
