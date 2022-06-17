class AddRateTypeReferencesToFocus < ActiveRecord::Migration
  def change
    add_reference :rating_types, :focu, index: true, foreign_key: true
  end
end
