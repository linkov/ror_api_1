class CreateSliderTypes < ActiveRecord::Migration
  def change
    create_table :slider_types do |t|
      t.string :name
      t.string :code
      t.references :question, foreign_key: true

      t.timestamps null: false
    end
  end
end
