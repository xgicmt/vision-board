class AddLandscapeToImage < ActiveRecord::Migration
  def change
  	add_column :images, :landscape, :boolean
  end
end
