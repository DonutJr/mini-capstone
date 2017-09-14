class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]

    # if @current_user
    #   return @current_user
    # else
      
    #   if session[:user_id]
    #     @current_user = User.find_by(id: session[:user_id])
    #     return @current_user
    #   end
    # end

  end
  helper_method :current_user



end
