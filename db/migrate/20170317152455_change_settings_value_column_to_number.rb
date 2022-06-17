class ChangeSettingsValueColumnToNumber < ActiveRecord::Migration
  def change
    change_column(:settings, :value, :integer)
  end
end
