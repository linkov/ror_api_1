class QuestionVideoPlaceholderUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_limit => [1800, 1800]

  version :preview do
    process :resize_to_fit => [300, 150]
  end


  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
