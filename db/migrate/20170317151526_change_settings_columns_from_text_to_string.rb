class ChangeSettingsColumnsFromTextToString < ActiveRecord::Migration
  def change
    change_column(:settings, :code, :string)
    change_column(:settings, :value, :string)
  end
end
