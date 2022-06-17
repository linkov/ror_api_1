class Api::V1::QuestionLinkSerializer < ActiveModel::Serializer
  attributes :id, :offline, :url, :question

  def question
    object.question.id
  end

end
