# encoding: utf-8

class TutorialStepImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_limit => [1024, 1024]

  version :thumb do
    process :resize_to_fit => [100, 100]
  end

  version :preview do
    process :resize_to_fill => [600, 600]
  end


  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
