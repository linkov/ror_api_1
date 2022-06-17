class CreateFocus < ActiveRecord::Migration
  def change
    create_table :focus do |t|
      t.string :title
      t.references :rating_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
