class AddExpertemailToUser < ActiveRecord::Migration
  def change
    add_column :users, :expertemail, :string
  end
end
