class Api::V1::TutorialStepSerializer < ActiveModel::Serializer
  attributes :id, :tutorial_id, :order, :text, :image_url, :video_url

  def video_url
    object.video.url
  end

  def image_url
    object.image.url
  end

end
