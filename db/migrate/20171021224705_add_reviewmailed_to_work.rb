class AddReviewmailedToWork < ActiveRecord::Migration
  def change
    add_column :works, :reviewmailed, :boolean, :default => false
  end
end
