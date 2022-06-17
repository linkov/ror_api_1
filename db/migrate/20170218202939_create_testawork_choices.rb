class CreateTestaworkChoices < ActiveRecord::Migration
  def change
    create_table :testawork_choices do |t|
      t.references :picture, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :work, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
