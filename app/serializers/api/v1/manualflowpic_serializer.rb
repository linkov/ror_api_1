class Api::V1::ManualflowpicSerializer < ActiveModel::Serializer
  attributes :id, :work_id, :width, :height, :url, :order

  def order
    object.order+1
  end

end
