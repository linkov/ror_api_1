class ChangePasswdToPassword < ActiveRecord::Migration
  def change
    rename_column :users, :passwd, :password
  end
end
