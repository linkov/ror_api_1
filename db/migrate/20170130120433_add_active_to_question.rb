class AddActiveToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :active, :boolean, default: false
  end
end
