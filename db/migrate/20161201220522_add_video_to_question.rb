class AddVideoToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :video, :string
    add_column :questions, :placeholder, :string
  end
end
