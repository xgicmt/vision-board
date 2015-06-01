class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
private

  def admin?

    if current_user && current_user.email == 'xgicmt@gmail.com' 
      true 
    else
   	  redirect_to root_path
    end
  end

end
