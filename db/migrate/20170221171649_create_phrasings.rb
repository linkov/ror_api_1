class CreatePhrasings < ActiveRecord::Migration
  def change
    create_table :phrasings do |t|
      t.string :code

      t.timestamps null: false
    end
  end
end
