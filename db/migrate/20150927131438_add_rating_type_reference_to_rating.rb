class AddRatingTypeReferenceToRating < ActiveRecord::Migration
  def change
    add_reference :ratings, :rating_type, index: true, foreign_key: true
  end
end
