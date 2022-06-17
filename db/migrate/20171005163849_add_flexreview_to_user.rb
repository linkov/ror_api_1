class AddFlexreviewToUser < ActiveRecord::Migration
  def change
    add_column :users, :flexreview, :boolean, :default => false
  end
end
