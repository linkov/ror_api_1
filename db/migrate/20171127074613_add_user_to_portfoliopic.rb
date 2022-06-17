class AddUserToPortfoliopic < ActiveRecord::Migration
  def change
    add_reference :portfoliopics, :user, index: true, foreign_key: true
  end
end
