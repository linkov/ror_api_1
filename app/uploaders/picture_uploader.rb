# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base


   include CarrierWave::MiniMagick
   include CarrierWave::Processing::MiniMagick

    storage :fog


  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

   process :resize_to_limit => [2048, 2048]



  version :thumb do
    process :resize_to_fit => [300, 300]
  end

   version :preview do
     process :resize_to_fill => [600, 600]
   end


   version :thumb_aspect_fill, from_version: :preview do
     process :resize_to_fill => [300, 300]
   end

   version :small_thumb, from_version: :thumb do
     process resize_to_fill: [30, 30]
     process :blur => [0, 8]
   end

   version :small_thumb_aspect_fit, from_version: :thumb do
     process resize_to_limit: [30, 30]
     process :blur => [0, 8]
   end


  def extension_white_list
    %w(jpg jpeg gif png)
  end


end
