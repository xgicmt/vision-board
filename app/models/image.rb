class Image < ActiveRecord::Base
  #attr_accessor :remote_image_url

  belongs_to :board

  mount_uploader :image_url, ImageUploader

 # def image
 #   @image ||= MiniMagick::Image.open("#{image_url}")
 # end
 def dimensions
    @dimensions ||= MiniMagick::Image.open("#{image_url}")
  end
 def is_landscape?
   dimensions['width'] > dimensions['height']
 end
end
