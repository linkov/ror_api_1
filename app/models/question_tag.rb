class QuestionTag < ActiveRecord::Base
  belongs_to :art_category
  belongs_to :question
end
