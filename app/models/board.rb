class Board < ActiveRecord::Base
  belongs_to :user
  has_many :images
  mount_uploader :image, ImageUploader
end
