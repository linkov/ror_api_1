class Api::V1::QuestionSerializer < ActiveModel::Serializer
  attributes :q_tutorials, :links, :mid, :emocard, :user, :package, :tool_code, :link, :art_categories, :max_taggitator_words, :id, :title, :slider_code, :rating_type_id, :suggestions, :video_url, :video_placeholder_url, :package_author, :package_name,:slider_wording_10,:slider_wording_20,:slider_wording_30,:slider_wording_40,:slider_wording_50,:slider_wording_60,:slider_wording_70,:slider_wording_80,:slider_wording_90,:slider_wording_100

  def q_tutorials
    object.q_tutorials.collect(&:id)
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

  def video_url
    object.video.url
  end

  def package_author
    object.package.author ? object.package.author : 'Anonymous'
  end

  def package_name
    object.package.title
  end

  def video_placeholder_url
    object.package.image.url
  end


  def slider_code
    object.slider_type.code
  end

  def suggestions
    object.suggestions.collect(&:id)
  end

end
