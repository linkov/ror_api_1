class CreateWebnotificationflows < ActiveRecord::Migration
  def change
    create_table :webnotificationflows do |t|
      t.string :code
      t.string :route

      t.timestamps null: false
    end
  end
end
