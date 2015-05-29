class ImagesController < ApplicationController
  def create
	  @board = Board.find(params[:board_id])
 	  @image = @board.images.build(image_params)

  	if @image.save
      @image.landscape!
  	  flash[:notice] = "Board Updated"
      redirect_to @board
    else
      flash[:alert] = "An Error occurred, possibly no image was selected."
      redirect_to @board
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
  	@image = @board.images.find(params[:id])
    if @image.destroy
  		flash[:notice] = "Image was successfully removed."
  		redirect_to @board
  	else
  		flash[:alert] = 'There was an error, please try again.'
  		redirect_to @board
  	end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @board = Board.find(@image.board_id)
    if @image.update_attributes(image_params)
      flash[:notice] = "Image updated"
      redirect_to @board   
    else
      flash[:alert] = "An error occurred updating your image, please try again."
      render :edit
    end
  end

  def show
    @board = Board.find(params[:board_id])
    @image = Image.find(params[:image_id]).dup
    # update_attributes is deprecated
    @image.update(board_id: @board.id)
    if @image.save
      flash[:notice] = "Your image was loaded."
      redirect_to @board
    else
      flash[:alert] = 'An error occured, please try again.'
      redirect_to @board
    end
  end

  private
  def image_params
    params.require(:image).permit(:image_url, :image_price, :remote_image_url_url, :landscape, :image_url_cache, :board_id)
  end

end
