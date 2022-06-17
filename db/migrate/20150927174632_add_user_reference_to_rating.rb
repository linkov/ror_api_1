class AddUserReferenceToRating < ActiveRecord::Migration
  def change
     add_reference :ratings, :author, references: :users, index: true
     add_foreign_key :ratings, :users, column: :author_id
  end
end
