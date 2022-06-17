class NotificationimageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog

  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  version :thumb do
    process :resize_to_fit => [300, 300]
  end


  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
