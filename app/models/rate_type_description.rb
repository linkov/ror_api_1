class RateTypeDescription < ActiveRecord::Base
  belongs_to :rating_type
  belongs_to :focu
  belongs_to :rate_level
  has_many :rate_type_description_translations
  translates :description
  accepts_nested_attributes_for :rate_type_description_translations, :allow_destroy => true
end
