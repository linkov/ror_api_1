class Api::V1::WebnotificationSerializer < ActiveModel::Serializer
  attributes :id, :title, :detail, :imageUrl, :test, :order

  def test
    object.image.url()
  end

  def imageUrl
    object.image.url()
  end

end
