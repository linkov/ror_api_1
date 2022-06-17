class AddEmocardToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :emocard, :boolean, :default => false
  end
end
