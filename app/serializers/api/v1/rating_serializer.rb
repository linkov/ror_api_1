class Api::V1::RatingSerializer < ActiveModel::Serializer
  attributes :id, :score, :author_id, :work_id, :question_id, :emocode, :created_at, :ratetime, :comment

  def ratetime
    object.created_at
  end

end
