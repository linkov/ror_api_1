class Api::V1::ArtCategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :work_categories, :parent_art_category

  def work_categories
    object.work_categories.collect(&:id)
  end

  def parent_art_category
    object.parent_art_category.id
  end

end
