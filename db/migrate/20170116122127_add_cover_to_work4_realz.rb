class AddCoverToWork4Realz < ActiveRecord::Migration
  def change
    remove_foreign_key :questions, column: :cover_id
    remove_reference :questions, :cover, references: :pictures, index: true

    add_reference :works, :cover, references: :pictures, index: true
    add_foreign_key :works, :pictures, column: :cover_id
  end
end
