class TutorialStep < ActiveRecord::Base
  belongs_to :tutorial
  has_many :tutorial_step_translations, dependent: :destroy
  mount_uploader :image, TutorialStepImageUploader
  mount_uploader :video, TutorialStepVideoUploader
  translates :text

  accepts_nested_attributes_for :tutorial_step_translations,  :allow_destroy => true
end
