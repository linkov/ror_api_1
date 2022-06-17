class AddRequirecommentToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :requirecomment, :bool, :default => false
  end
end
