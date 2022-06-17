class AddPlaceholderToQTutorial < ActiveRecord::Migration
  def change
    add_column :q_tutorials, :placeholder, :string
  end
end
