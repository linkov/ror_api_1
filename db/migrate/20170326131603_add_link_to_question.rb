class AddLinkToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :link, :text
  end
end
