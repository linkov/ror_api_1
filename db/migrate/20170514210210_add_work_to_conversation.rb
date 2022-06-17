class AddWorkToConversation < ActiveRecord::Migration
  def change
    add_reference :conversations, :work, index: true, foreign_key: true
  end
end
