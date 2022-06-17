class Suggestion < ActiveRecord::Base
  belongs_to :question
  has_many :suggestion_translations, dependent: :destroy
  has_many :suggestion_choices, dependent: :destroy
  translates :title
  accepts_nested_attributes_for :suggestion_translations, :allow_destroy => true
  globalize_accessors :locales => [:en, :de], :attributes => [:title]
end
