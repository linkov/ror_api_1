class RemoveCoverFkStuffKHuyam < ActiveRecord::Migration
  def change
    remove_foreign_key :works, column: :cover_id
    remove_reference :works, :cover, references: :pictures, index: true
  end
end
