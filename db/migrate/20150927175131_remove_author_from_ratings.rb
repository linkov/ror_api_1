class RemoveAuthorFromRatings < ActiveRecord::Migration
  def change

    # remove_foreign_key :ratings, :author
    # remove_reference :ratings, :author, references: :users, index: true
    # remove_index :ratings, :author_id
    # remove_column :ratings, :author_id
    remove_reference :ratings, :author, references: :users, index: true
    remove_foreign_key :ratings, :users

  end
end
