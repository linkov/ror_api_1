class AddImportanceToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :importance, :integer, :default => 5
  end
end
