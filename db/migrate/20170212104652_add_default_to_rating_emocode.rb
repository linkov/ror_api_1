class AddDefaultToRatingEmocode < ActiveRecord::Migration
  def change
    change_column_default :ratings, :emocode, 0
  end
end
