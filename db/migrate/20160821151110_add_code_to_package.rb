class AddCodeToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :code, :string
  end
end
