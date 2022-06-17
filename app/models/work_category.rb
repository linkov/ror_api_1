class WorkCategory < ActiveRecord::Base
  has_and_belongs_to_many :rating_types, dependent: :destroy
  has_and_belongs_to_many :art_categories
  has_many :works, dependent: :destroy
  has_many :packages
end
