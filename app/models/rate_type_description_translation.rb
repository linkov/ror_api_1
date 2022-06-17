class RateTypeDescriptionTranslation < ActiveRecord::Base
  belongs_to :rate_type_description
  validates_uniqueness_of :locale, :scope => :rate_type_description_id
end
