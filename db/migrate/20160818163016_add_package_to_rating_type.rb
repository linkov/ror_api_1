class AddPackageToRatingType < ActiveRecord::Migration
  def change
    add_reference :rating_types, :package, index: true, foreign_key: true
  end
end
