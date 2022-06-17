class Api::V1::QuestionAdminSerializer < ActiveModel::Serializer
  attributes :core_art_categories, :question_tags, :main_root_category_code, :requirecomment, :emocard, :pack_title, :low_en, :mid_en, :high_en,:low_de, :mid_de, :high_de, :user, :q_tutorials, :pack, :link, :art_categories, :tool_code, :max_taggitator_words, :id, :title_en, :title_de, :suggestions, :slider_type_id, :package_id, :importance, :manualflow,
  :slider_wording_10_en,:slider_wording_20_en,:slider_wording_30_en,:slider_wording_40_en,:slider_wording_50_en,:slider_wording_60_en,:slider_wording_70_en,:slider_wording_80_en,:slider_wording_90_en,:slider_wording_100_en,
  :slider_wording_10_de,:slider_wording_20_de,:slider_wording_30_de,:slider_wording_40_de,:slider_wording_50_de,:slider_wording_60_de,:slider_wording_70_de,:slider_wording_80_de,:slider_wording_90_de,:slider_wording_100_de, :question_links, :updated_at


  def core_art_categories
    relevant_tags = object.question_tags.where(QuestionTag.arel_table[:relevance].gteq(4) ).to_a
    core_art_categories = ArtCategory.where(:id =>relevant_tags.collect(&:art_category_id) )
    core_art_categories.collect(&:id)
  end

  def art_categories
    object.art_categories.collect(&:id)
  end

  def question_tags
    object.question_tags.collect(&:id)
  end

  def main_root_category_code

      return object.main_root_category_code()

  end


  def user
    if object.user
      object.user.id
    end
  end

  def pack
    if object.package
      object.package.id
    end

  end

  def pack_title
    if object.package
      object.package.title
    end

  end

  def package_id
    if object.package
      object.package.id.to_s
    end

  end

  def slider_type
    object.slider_type.id
  end

  def slider_type_id
    object.slider_type.id.to_s
  end

  def tool_code
    object.slider_type.code
  end

  def q_tutorials
    object.q_tutorials.collect(&:id)
  end

  def suggestions
    object.suggestions.collect(&:id)
  end

  def question_links
    object.question_links.collect(&:id)
  end

end
