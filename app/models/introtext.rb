class Introtext < ActiveRecord::Base
  translates :text
  has_many :introtext_translations, dependent: :destroy

  accepts_nested_attributes_for :introtext_translations,  :allow_destroy => true


end
