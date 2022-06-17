class AddAudioToWorks < ActiveRecord::Migration
  def change
    add_column :works, :audio, :string
  end
end
