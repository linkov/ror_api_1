class ParentArtCategory < ActiveRecord::Base

  has_many  :parent_art_category_translations, dependent: :destroy
  translates :title
  accepts_nested_attributes_for :parent_art_category_translations, :allow_destroy => true
  has_many :art_categories
  accepts_nested_attributes_for :art_categories

  globalize_accessors :locales => [:en, :de], :attributes => [:title]

end
