class Image < ActiveRecord::Base

  belongs_to :board
  mount_uploader :image_url, ImageUploader
  validates :image_url, presence: true

  def dimensions
    @dimensions ||= MiniMagick::Image.open("#{image_url}")
  end

  def is_landscape?
    dimensions['width'] > dimensions['height']
  end

  def landscape!
    if is_landscape? 
      self.landscape =true
      self.save
    end
  end

end
