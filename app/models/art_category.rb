class ArtCategory < ActiveRecord::Base

  mount_uploader :picture, ArtcategoryPictureUploader
  has_and_belongs_to_many :works
  has_many :question_tags
  has_many :questions, :through => :question_tags
  has_and_belongs_to_many :work_categories
  has_many  :art_category_translations, dependent: :destroy
  translates :title
  accepts_nested_attributes_for :art_category_translations, :allow_destroy => true
  accepts_nested_attributes_for :work_categories

  belongs_to :parent_art_category

  has_and_belongs_to_many :users

  globalize_accessors :locales => [:en, :de], :attributes => [:title]

end
