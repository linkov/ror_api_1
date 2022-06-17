class AddPresenterquestionanswerToWork < ActiveRecord::Migration
  def change
    add_column :works, :presenterquestionanswer, :text
  end
end
