class ChangeImagePriceAttribute < ActiveRecord::Migration
  def change
  	change_column :images, :image_price, :integer
  end
end
