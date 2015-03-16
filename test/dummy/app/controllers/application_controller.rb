class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
 	  @current_user = User.find 1
  end

  def can_administer?
  	unless current_user.admin?
  		raise "Access Denied"
    else
      return true
  	end
  end

end
