class AddLimitsToRatingTypes < ActiveRecord::Migration
  def change
    add_column :rating_types, :limit, :integer
    add_column :rating_types, :limit_rate_count, :integer
  end
end
