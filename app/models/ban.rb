class Ban < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  belongs_to :work
end
