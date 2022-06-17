class RatingTypeTranslation < ActiveRecord::Base
  belongs_to :rating_type
  validates_uniqueness_of :locale, :scope => :rating_type_id
end
