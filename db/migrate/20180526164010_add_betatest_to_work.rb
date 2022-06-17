class AddBetatestToWork < ActiveRecord::Migration
  def change
    add_column :works, :betatest, :boolean, :default => false
  end
end
