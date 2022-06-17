class AddSimpleCoverIdToWork < ActiveRecord::Migration
  def change
    add_column :works, :cover_id, :integer
  end
end
