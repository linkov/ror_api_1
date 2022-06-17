class AddFocusReferencesWork < ActiveRecord::Migration
  def change
    add_reference :works, :focu, index: true, foreign_key: true
  end
end
