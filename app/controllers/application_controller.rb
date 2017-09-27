class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :calculate_cart_count

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

  def autheticate_user!
    redirect_to '/login' unless current_user
  end

  def authenticate_admin!
    redirect_to "/" unless current_user && current_user.admin
  end

  def calculate_cart_count
    if current_user
      @cart_count = current_user.current_cart.count
    else
      @cart_count = 0
    end

  end




end
