class Api::V1::WebnotificationflowSerializer < ActiveModel::Serializer
  attributes :id, :webnotifications, :route, :code


  def webnotifications
    object.webnotifications.collect(&:id)
  end

end
