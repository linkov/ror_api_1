class AddExpertcommentToWork < ActiveRecord::Migration
  def change
    add_column :works, :expertcomment, :text
  end
end
