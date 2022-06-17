class AddTimeToQtutorial < ActiveRecord::Migration
  def change
    add_column :q_tutorials, :time, :integer
  end
end
