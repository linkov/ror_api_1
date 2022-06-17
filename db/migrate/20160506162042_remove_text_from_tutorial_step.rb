class RemoveTextFromTutorialStep < ActiveRecord::Migration
  def change
    remove_column :tutorial_steps, :text
  end
end
