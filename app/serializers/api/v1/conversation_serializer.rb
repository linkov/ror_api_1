class Api::V1::ConversationSerializer < ActiveModel::Serializer
  attributes :id, :sender, :recipient, :messages, :question_id, :work_id, :rating, :recipient_uid, :unread_count

  def unread_count
    object.messages.where(:read => false).where.not(:user =>scope.current_user).count
  end

  def messages
    object.messages.collect(&:id)
  end

  def sender
    object.sender.id
  end

  def recipient
    object.recipient.id
  end

  def rating

    rate = Rating.where(:work_id => object.work_id,:question => object.question_id, :author_id => object.recipient_id).first
    rate.id
  end

  def recipient_uid
    object.recipient.uid
  end


end
