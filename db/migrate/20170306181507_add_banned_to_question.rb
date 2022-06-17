class AddBannedToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :banned, :boolean, :default => false
  end
end
