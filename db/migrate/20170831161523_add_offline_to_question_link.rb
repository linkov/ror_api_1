class AddOfflineToQuestionLink < ActiveRecord::Migration
  def change
    add_column :question_links, :offline, :boolean, :default => false
  end
end
