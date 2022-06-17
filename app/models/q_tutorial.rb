class QTutorial < ActiveRecord::Base
  belongs_to :question
  belongs_to :tutorial_type
  translates :title, :text, :link
  mount_uploader :placeholder, TutorialplaceholderUploader

  globalize_accessors :locales => [:en, :de], :attributes => [:title, :text, :link]
end
