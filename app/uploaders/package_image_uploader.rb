# encoding: utf-8

class PackageImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog

  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_limit => [2048, 2048]



  version :thumb do
    process :resize_to_fit => [168, 90]
  end

  version :preview do
    process :resize_to_fill => [600, 600]
  end


  version :thumb_aspect_fill, from_version: :preview do
    process :resize_to_fill => [100, 100]
  end



  def extension_white_list
    %w(jpg jpeg gif png)
  end


end
