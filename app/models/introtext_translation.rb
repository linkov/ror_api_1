class IntrotextTranslation < ActiveRecord::Base
  belongs_to :introtext
  validates_uniqueness_of :locale, :scope => :introtext_id
end
