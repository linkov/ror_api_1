class Tutorial < ActiveRecord::Base
  has_many :tutorial_steps
  belongs_to :rating_type
  accepts_nested_attributes_for :tutorial_steps

end
