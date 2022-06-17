class Api::V1::MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :conversation_id, :message_time, :read, :user_id



end
