class AddReviewlangToWork < ActiveRecord::Migration
  def change
    add_column :works, :reviewlang, :string
  end
end
