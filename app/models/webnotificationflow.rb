class Webnotificationflow < ActiveRecord::Base
  has_many :webnotifications
  has_and_belongs_to_many :users

end
