class TutorialStepTranslation < ActiveRecord::Base
  belongs_to :tutorial_step
  validates_uniqueness_of :locale, :scope => :tutorial_step_id
end
