class AddPresenterquestionToWork < ActiveRecord::Migration
  def change
    add_column :works, :presenterquestion, :text
  end
end
