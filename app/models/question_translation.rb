class QuestionTranslation < ActiveRecord::Base
  belongs_to :question
  validates_uniqueness_of :locale, :scope => :question_id
end
