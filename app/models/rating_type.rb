class RatingType < ActiveRecord::Base
  has_ancestry
  has_ancestry :orphan_strategy => :rootify
  belongs_to :focu
  belongs_to :package
  has_many :tutorials, dependent: :destroy
  has_many :rate_type_descriptions, dependent: :destroy
  has_many :rating_type_translations, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_and_belongs_to_many :work_category, dependent: :nullify
  has_many :children, class_name: "RatingType", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent, class_name: "RatingType"

  translates :name

  accepts_nested_attributes_for :focu,:work_category,:rating_type_translations,:rate_type_descriptions,:questions, :tutorials, :allow_destroy => true
  after_initialize :set_defaults, unless: :persisted?


  def set_defaults
    self.priority  ||= 5
    self.limit  ||= 25
    self.limit_rate_count  ||= 25
  end

  def name_and_priority
    self.name + " (priority " + self.priority.to_s + ") " + self.package.title
  end

end
