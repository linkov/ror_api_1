class Question < ActiveRecord::Base
  has_ancestry
  has_ancestry :orphan_strategy => :rootify


  belongs_to :package
  belongs_to :rating_type
  belongs_to :rate_level
  belongs_to :slider_type
  has_many :rating, dependent: :destroy
  has_many  :question_translations, dependent: :destroy
  has_many  :suggestions, dependent: :destroy
  has_many  :question_links, dependent: :destroy
  has_many :suggestion_word_choices, dependent: :destroy
  has_many :bans, dependent: :destroy
  has_many :suggestion_choices, dependent: :destroy
  has_many :suggestion_word_choice_counts, dependent: :destroy
  has_many :suggestion_word_black_list_items, dependent: :destroy
  has_many :conversations

  belongs_to :user

  has_many :q_tutorials, dependent: :destroy

  has_one :phrasing

  has_and_belongs_to_many :works

  has_many :question_tags, dependent: :destroy
  has_many :art_categories, :through => :question_tags

  amoeba do
    enable
    include_association :art_categories
  end

  mount_uploader :placeholder, QuestionVideoPlaceholderUploader
  mount_uploader :video, QuestionVideoUploader

  translates :title, :low, :mid, :high, :slider_wording_10, :slider_wording_20, :slider_wording_30, :slider_wording_40, :slider_wording_50, :slider_wording_60, :slider_wording_70, :slider_wording_80, :slider_wording_90, :slider_wording_100
  globalize_accessors :locales => [:en, :de], :attributes => [:title, :low, :mid, :high, :slider_wording_10, :slider_wording_20, :slider_wording_30, :slider_wording_40, :slider_wording_50, :slider_wording_60, :slider_wording_70, :slider_wording_80, :slider_wording_90, :slider_wording_100]

  accepts_nested_attributes_for :art_categories
  accepts_nested_attributes_for :phrasing
  accepts_nested_attributes_for :q_tutorials,:question_links, :suggestions, :slider_type, :question_translations, :allow_destroy => true


  scope :active, -> {
    where(:active => true)
  }


  scope :slider_type, -> {
  }

  after_save :set_defaults, unless: :persisted?


  def set_defaults
    self.phrasing  ||= Phrasing.where(:code => "universal").first

  end

  def main_root_category_code


    relevant_tag = self.question_tags.where(QuestionTag.arel_table[:relevance].gteq(4) ).to_a.first


    if relevant_tag
      # tag = QuestionTag.find(relevant_tag)
      code = relevant_tag.art_category.parent_art_category.code
      return code
    else


      emotags = ArtCategory.where(:parent_art_category => ParentArtCategory.where(:code => "emotion").first)
      techtags = ArtCategory.where(:parent_art_category => ParentArtCategory.where(:code => "technique").first)
      concepttags = ArtCategory.where(:parent_art_category => ParentArtCategory.where(:code => "concept").first)
      populartags = ArtCategory.where(:parent_art_category => ParentArtCategory.where(:code => "popular").first)


      root_category_code = "";

      emotags_count = self.art_categories.where(:id => emotags.collect(&:id)).count
      techtags_count = self.art_categories.where(:id => techtags.collect(&:id)).count
      concepttags_count = self.art_categories.where(:id => concepttags.collect(&:id)).count
      populartags_count = self.art_categories.where(:id => populartags.collect(&:id)).count

      if (emotags_count >= techtags_count && emotags_count >= concepttags_count && emotags_count >= populartags_count)
        root_category = ParentArtCategory.where(:code => "emotion").first
        root_category_code = root_category.code
      end

      if (techtags_count >= emotags_count && techtags_count >= concepttags_count && techtags_count >= populartags_count)
        root_category = ParentArtCategory.where(:code => "technique").first
        root_category_code = root_category.code
      end

      if (concepttags_count >= techtags_count && concepttags_count >= emotags_count && concepttags_count >= populartags_count)
        root_category = ParentArtCategory.where(:code => "concept").first
        root_category_code = root_category.code
      end

      if (populartags_count >= techtags_count && populartags_count >= emotags_count && concepttags_count >= emotags_count)
        root_category = ParentArtCategory.where(:code => "popular").first
        root_category_code = root_category.code
      end


      return root_category_code

    end
  end


end
