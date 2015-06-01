class AdminsController < ApplicationController

  def index
    admin?
      @users = User.all
      @boards = Board.all
      @images = Image.all
  end
  
end
