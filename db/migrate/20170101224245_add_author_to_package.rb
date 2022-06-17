class AddAuthorToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :author, :string
  end
end
