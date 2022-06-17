class Webnotification < ActiveRecord::Base
  belongs_to :webnotificationflow
  mount_uploader :image, NotificationimageUploader
  translates :title, :detail
  globalize_accessors :locales => [:en, :de], :attributes => [:title,:detail]

end
