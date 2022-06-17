class AddDefaultToOrd < ActiveRecord::Migration
  def change
     change_column_default :portfoliopics, :order, 0
  end
end
