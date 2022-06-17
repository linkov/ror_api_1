# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base


  include CarrierWave::MiniMagick
  include CarrierWave::Processing::MiniMagick

  storage :fog


  def url (version=nil)
    if version
      "https://efwfileupload.s3-accelerate.amazonaws.com/uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/#{version}_#{file.filename}"

    else

      "https://efwfileupload.s3-accelerate.amazonaws.com/uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/#{file.filename}"

    end
  end


  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_limit => [2048, 2048]

  version :preview do
    process :resize_to_fit => [600, 600]
  end

  version :thumb, from_version: :preview do
    process :resize_to_fit => [300, 300]
  end


  version :small_thumb, from_version: :thumb do
    process resize_to_fit: [30, 30]
    process :blur => [0, 8]
  end


  def extension_white_list
    %w(jpg jpeg gif png)
  end


end
