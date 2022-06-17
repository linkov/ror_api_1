class PromoMessageTranslation < ActiveRecord::Base
  belongs_to :promo_message
  validates_uniqueness_of :locale, :scope => :promo_message_id
end
