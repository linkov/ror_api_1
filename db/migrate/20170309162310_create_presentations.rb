class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :code

      t.timestamps null: false
    end
  end
end
