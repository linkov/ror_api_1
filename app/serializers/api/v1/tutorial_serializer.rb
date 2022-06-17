class Api::V1::TutorialSerializer < ActiveModel::Serializer
  attributes :id, :rating_type, :tutorial_steps

  def tutorial_steps
    object.tutorial_steps.collect(&:id)
  end

  def rating_type
    object.rating_type_id
  end

end
