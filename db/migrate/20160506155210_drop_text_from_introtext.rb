class DropTextFromIntrotext < ActiveRecord::Migration
  def change
    remove_column :introtexts, :text
  end
end
