class AddQualityscoreAndRatingToBackrate < ActiveRecord::Migration
  def change
    add_column :backrates, :qualityscore, :integer
    add_reference :backrates, :rating, index: true, foreign_key: true
  end
end
