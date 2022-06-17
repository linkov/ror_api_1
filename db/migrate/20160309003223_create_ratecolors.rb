class CreateRatecolors < ActiveRecord::Migration
  def change
    create_table :ratecolors do |t|
      t.integer "rating"
      t.integer "red"
      t.integer "green"
    end
  end
end
