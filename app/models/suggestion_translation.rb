class SuggestionTranslation < ActiveRecord::Base
  belongs_to :suggestion
  validates_uniqueness_of :locale, :scope => :suggestion_id
end
