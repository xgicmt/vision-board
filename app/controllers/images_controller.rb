class ImagesController < ApplicationController
  def create
  	  @board = Board.find(params[:board_id])
  	  @images = @board.images
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
    #if @image.update_attributes(board_id: nil)
  		flash[:notice] = "Image was successfully removed."
  		redirect_to @board
  	else
  		flash[:alert] = 'There was an error, please try again.'
  		redirect_to @board
  	end
  end

  def edit
   # @board = Board.find(params[:id])
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
   # @pict = Image.find(params[:image_id])
   # stringUrl = @pict.image_url.to_s
    @image = Image.find(params[:image_id]).dup
    @image.update_attributes(board_id: @board.id)
   # @image.update_attributes(image_url: stringUrl)
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

#"remote_image_url_url"=>"http://pixabay.com/get/b35a364ed057ba2df99b/1431800290/4e5944d5a1f1ff7a71c8aa7c_640.jpg "}
#"remote_image_url_url"=>"http://pixabay.com/get/b35a364ed057ba2df99b/1431800290/4e5944d5a1f1ff7a71c8aa7c_640.jpg"}