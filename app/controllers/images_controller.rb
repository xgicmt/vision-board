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
  end

  private

  def image_params
    params.require(:image).permit(:image_url, :image_price, :board_id)
  end
end