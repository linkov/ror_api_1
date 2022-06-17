class DropDescriptionFromRateTypeDescription < ActiveRecord::Migration
  def change
    remove_column :rate_type_descriptions, :description
  end
end
