class AddCoverToWork < ActiveRecord::Migration
  def change
    add_reference :questions, :cover, references: :pictures, index: true
    add_foreign_key :questions, :pictures, column: :cover_id
  end
end
