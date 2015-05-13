class ModifyImageAttributes < ActiveRecord::Migration
  def change
  	rename_column :images, :imageUrl, :image_url
  	rename_column :images, :imagePrice, :image_price
  	
  end
end
