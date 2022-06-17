class CreateIntrotexts < ActiveRecord::Migration
  def change
    create_table :introtexts do |t|
      t.text :text

      t.timestamps null: false
    end
  end
end
