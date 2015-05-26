class Board < ActiveRecord::Base
  belongs_to :user
  has_many :images
  
  before_save :build_shared_link

  private

  def build_shared_link
    self.shared_link = [*('a'..'z'),*('A'..'Z'),*('0'..'9')].to_a.shuffle[0,8].join
  end


end
