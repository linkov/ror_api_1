class AddPresentationToWork < ActiveRecord::Migration
  def change
    add_reference :works, :presentation, index: true, foreign_key: true
  end
end
