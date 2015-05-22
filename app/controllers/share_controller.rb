class ShareController < ApplicationController
  def show
  	@board = Board.find_by_shared_link(params[:id])
  end
end