class AddTutorialLinkToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :tutorial_link, :string
  end
end
