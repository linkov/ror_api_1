class Api::V1::WorkCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :active

  def active
    object.packages.count > 0
  end

end
