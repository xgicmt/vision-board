class BoardsController < ApplicationController
  def index
  	@boards = Board.all
  end

  def show
  	@board = Board.find(params[:id])

  end

  def new
  	@board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
    	redirect_to @board, notice: 'Board successfully created!'
    else
    	flash[:error] = "Error creating your Board, please try agian."
    	render :new
    end
  end
  def update
  #  if Image.update_attributes(params.require(:image).permit(:imageUrl, :imagePrice, :board_id))
  #  	flash[:notice] = "Board Updated"
  #  	redirect_to @board
  #  else
  #  	flash[:error] = "Error occurred"
  #  	redirect_to = @board
  #  end
  end
  def edit
  end

private

    def board_params
      params.require(:board).permit(:name)
    end

end
