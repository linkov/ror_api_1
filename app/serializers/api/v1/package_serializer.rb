class Api::V1::PackageSerializer < ActiveModel::Serializer
  attributes :active, :id, :title, :code, :description, :price, :image_url, :video_url, :questions, :work_category

  def questions
    object.questions.collect(&:id)
  end

  def image_url
    object.image.url(:thumb)
  end

  def video_url
    object.video.url
  end

  def work_category
    if object.work_category
      object.work_category.id
    end
  end

end
