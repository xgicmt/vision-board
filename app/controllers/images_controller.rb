class ImagesController < ApplicationController
  def create
  	  @board = Board.find(params[:board_id])
  	  @images = @board.images
  	  @image = @board.images.build(image_params)

  	  if @image.save
  	   	flash[:notice] = "Board Updated"
    	redirect_to @board
    else
    	flash[:error] = "Error occurred"
    	redirect_to = @board
    end
  end

  def destroy
  	@board = Board.find(params[:board_id])
  	@image = @board.images.find(params[:id])
  	if @image.destroy
  		flash[:notice] = "Image was successfully removed."
  		redirect_to @board
  	else
  		flash[:notice] = 'There was an error, please try again.'
  		redirect_to @board
  	end
  end

  private

  def image_params
    params.require(:image).permit(:image_url, :image_price, :remote_image_url_url, :image_url_cache, :board_id)
  end
end

#"remote_image_url_url"=>"http://pixabay.com/get/b35a364ed057ba2df99b/1431800290/4e5944d5a1f1ff7a71c8aa7c_640.jpg "}
#"remote_image_url_url"=>"http://pixabay.com/get/b35a364ed057ba2df99b/1431800290/4e5944d5a1f1ff7a71c8aa7c_640.jpg"}