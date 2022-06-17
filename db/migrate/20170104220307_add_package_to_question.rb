class AddPackageToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :package, index: true, foreign_key: true
  end
end
