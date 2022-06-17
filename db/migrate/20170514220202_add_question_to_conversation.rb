class AddQuestionToConversation < ActiveRecord::Migration
  def change
    add_reference :conversations, :question, index: true, foreign_key: true
  end
end
