class AddCodeToFocus < ActiveRecord::Migration
  def change
    add_column :focus, :code, :string
  end
end
