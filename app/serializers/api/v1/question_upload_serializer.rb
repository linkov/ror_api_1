class Api::V1::QuestionUploadSerializer < ActiveModel::Serializer
  attributes :question_tags, :links, :user, :package, :tool_code, :link, :art_categories, :id, :title, :slider_code, :rating_type_id, :package_name,:slider_wording_10,:slider_wording_20,:slider_wording_30,:slider_wording_40,:slider_wording_50,:slider_wording_60,:slider_wording_70,:slider_wording_80,:slider_wording_90,:slider_wording_100

  # def question_tags
  #   if object.question_tags.length > 0
  #     arr = object.question_tags.collect { |tag|
  #       {
  #           'id': tag.id,
  #           'question':tag.question_id,
  #           'art_category': tag.art_category_id,
  #           'relevance':tag.relevance
  #        }
  #     }
  #
  #   end
  # end

  def question_tags
    object.question_tags.collect(&:id)
  end

  def links
    object.question_links.collect(&:id)
  end

  def art_categories
    object.art_categories.collect(&:id)
  end

  def tool_code
    object.slider_type.code
  end

  def user
    if object.user
      object.user.id
    end
  end

  def package
    object.package.id
  end


  def package_name
    object.package.title
  end


  def slider_code
    object.slider_type.code
  end


end
