class Portfoliopic < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, PortfoliopicUploader
end
