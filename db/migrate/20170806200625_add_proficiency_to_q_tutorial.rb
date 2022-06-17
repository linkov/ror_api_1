class AddProficiencyToQTutorial < ActiveRecord::Migration
  def change
    add_reference :q_tutorials, :proficiency, index: true, foreign_key: true
  end
end
