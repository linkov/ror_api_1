class Api::V1::QuestionTagSerializer < ActiveModel::Serializer
  attributes :id, :relevance, :question, :art_category

  def question
    object.question_id
  end

  def art_category
    object.art_category_id
  end


end
