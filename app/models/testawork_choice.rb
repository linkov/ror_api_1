class TestaworkChoice < ActiveRecord::Base
  belongs_to :picture
  belongs_to :user
  belongs_to :work
end
