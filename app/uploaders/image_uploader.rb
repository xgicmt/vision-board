# encoding: utf-8
class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  storage :fog

  def store_dir
    "uploads/#{single_store_dir}"
  end

  def single_store_dir
    data_column = model.send("#{mounted_as}_identifier")
    "#{mounted_as}/#{data_column[0..1]}/#{data_column[2..3]}/#{data_column[4..5]}"
  end

  process :resize_to_fit => [nil, 300]

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
