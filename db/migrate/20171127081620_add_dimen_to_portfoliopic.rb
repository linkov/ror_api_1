class AddDimenToPortfoliopic < ActiveRecord::Migration
  def change
    add_column :portfoliopics, :width, :float
    add_column :portfoliopics, :height, :float
  end
end
