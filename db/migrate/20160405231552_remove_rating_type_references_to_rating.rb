class RemoveRatingTypeReferencesToRating < ActiveRecord::Migration
  def change
    remove_reference :ratings, :rating_type, index: true, foreign_key: true
  end
end
