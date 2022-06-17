class Picture < ActiveRecord::Base
  belongs_to :work
  counter_culture :work, :execute_after_commit => true
  mount_uploader :image, ImageUploader
  has_many :testawork_choices, dependent: :destroy

end
