class CreateTutorialSteps < ActiveRecord::Migration
  def change
    create_table :tutorial_steps do |t|
      t.integer :tutorial_id
      t.string :image
      t.text :text

      t.timestamps null: false
    end
  end
end
