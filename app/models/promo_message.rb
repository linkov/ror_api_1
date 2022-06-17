class PromoMessage < ActiveRecord::Base

  has_many  :promo_message_translations, dependent: :destroy
  translates :title
  has_and_belongs_to_many :users

  accepts_nested_attributes_for :promo_message_translations, :allow_destroy => true
end
