class AddWorklinkToWork < ActiveRecord::Migration
  def change
    add_column :works, :worklink, :text
  end
end
