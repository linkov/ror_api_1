class AddEmocodeToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :emocode, :integer
  end
end
