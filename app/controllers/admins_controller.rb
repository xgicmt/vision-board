class AdminsController < ApplicationController

  def index
    admin?
      @users = User.all
      @boards = Board.all
      @images = Image.all
  end

  def admin_user_delete
    admin?
    @user = User.find(params[:user_id])
    email = @user.email
    if @user.destroy
      flash[:notice] =  "\"#{email}\" was deleted successfully"
      redirect_to  '/admins'
    else
      flash[:alert] = "User was not deleted"
      render :index
    end
  end

end
