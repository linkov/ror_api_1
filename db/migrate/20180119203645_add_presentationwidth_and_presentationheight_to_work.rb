class AddPresentationwidthAndPresentationheightToWork < ActiveRecord::Migration
  def change
    add_column :works, :presentationwidth, :integer
    add_column :works, :presentationheight, :integer
  end
end
