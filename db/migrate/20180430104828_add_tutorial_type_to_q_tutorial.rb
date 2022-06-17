class AddTutorialTypeToQTutorial < ActiveRecord::Migration
  def change
    add_reference :q_tutorials, :tutorial_type, index: true, foreign_key: true
  end
end
