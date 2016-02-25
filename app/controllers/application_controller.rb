class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize  #makes them globally accessible

  def current_user
   return @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user #this is current_user the method
  end

  def authorize
    redirect_to root_path unless logged_in?
  end


end
