class AddVideoToTutorialStep < ActiveRecord::Migration
  def change
    add_column :tutorial_steps, :video, :string
  end
end
