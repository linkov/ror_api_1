class AddReviewratebackscoreAndReviewratebackcommentToWork < ActiveRecord::Migration
  def change
    add_column :works, :reviewratebackscore, :integer
    add_column :works, :reviewratebackcomment, :text
  end
end
