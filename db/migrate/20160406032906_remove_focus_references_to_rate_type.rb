class RemoveFocusReferencesToRateType < ActiveRecord::Migration
  def change
    remove_reference :focus, :rating_type, index: true, foreign_key: true
  end
end
