# encoding: utf-8

class TutorialStepVideoUploader < CarrierWave::Uploader::Base

  storage :fog

  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


end
