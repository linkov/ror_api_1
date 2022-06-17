class CreateRateLevels < ActiveRecord::Migration
  def change
    create_table :rate_levels do |t|
      t.integer :value

      t.timestamps null: false
    end
  end
end
