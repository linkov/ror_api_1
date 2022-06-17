class AddLimitsToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :quality_limit, :integer, :default => 25
    add_column :questions, :quality_limit_rate_count, :integer, :default => 50
  end
end
