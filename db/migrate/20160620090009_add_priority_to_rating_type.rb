class AddPriorityToRatingType < ActiveRecord::Migration
  def change
    add_column :rating_types, :priority, :integer
  end
end
