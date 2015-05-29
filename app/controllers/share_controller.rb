class ShareController < ApplicationController
  def show
    # dynamic finders are deprecated
  	@board = Board.find_by(shared_link: params[:id])
  end
end