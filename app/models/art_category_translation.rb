class ArtCategoryTranslation < ActiveRecord::Base
  belongs_to :art_category
  validates_uniqueness_of :locale, :scope => :art_category_id
end
