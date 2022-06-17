class AddPhrasingToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :phrasing, index: true, foreign_key: true
  end
end
