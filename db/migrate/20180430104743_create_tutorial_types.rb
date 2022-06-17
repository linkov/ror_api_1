class CreateTutorialTypes < ActiveRecord::Migration
  def change
    create_table :tutorial_types do |t|
      t.string :code
      t.string :icon
      t.string :name

      t.timestamps null: false
    end
  end
end
