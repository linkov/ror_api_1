class AddCodeToRateType < ActiveRecord::Migration
  def change
    add_column :rating_types, :code, :string
  end
end
