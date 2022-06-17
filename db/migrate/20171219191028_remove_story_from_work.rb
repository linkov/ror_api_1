class RemoveStoryFromWork < ActiveRecord::Migration
  def change
    remove_column :works, :story, :text
  end
end
