class CreateRateTypeDescriptions < ActiveRecord::Migration
  def change
    create_table :rate_type_descriptions do |t|
      t.references :rating_type, index: true, foreign_key: true
      t.references :focu, index: true, foreign_key: true
      t.references :rate_level, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
