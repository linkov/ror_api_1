class AddPositionToRatingTypes < ActiveRecord::Migration
  def change
    add_column :rating_types, :position, :integer
  end
end
