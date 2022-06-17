class ParentArtCategoryTranslation < ActiveRecord::Base
  belongs_to :parent_art_category
  validates_uniqueness_of :locale, :scope => :parent_art_category_id
end
