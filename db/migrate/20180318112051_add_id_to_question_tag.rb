class AddIdToQuestionTag < ActiveRecord::Migration
  def change
    add_column :question_tags, :id, :primary_key
  end
end
