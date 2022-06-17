class Backrate < ActiveRecord::Base
  belongs_to :user
  belongs_to :work
  belongs_to :question
  belongs_to :rating
end
