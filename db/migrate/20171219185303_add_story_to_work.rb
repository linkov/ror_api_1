class AddStoryToWork < ActiveRecord::Migration
  def change
    add_column :works, :story, :text
  end
end
