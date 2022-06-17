class RemoveTutorialLinkFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :tutorial_link, :string
  end
end
