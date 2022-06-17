class ChangePicsType < ActiveRecord::Migration
  def change
    change_column(:works, :pics, :text)
  end
end
