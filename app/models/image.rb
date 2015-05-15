class Image < ActiveRecord::Base
  attr_accessor :remote_image_url

  belongs_to :board

  mount_uploader :image_url, ImageUploader
end
