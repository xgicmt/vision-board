class Image < ActiveRecord::Base
  belongs_to :board
  mount_uploader :image_url, ImageUploader
end
