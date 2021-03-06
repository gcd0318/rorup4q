class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
  end

  def create
    if user = User.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      session[:condHash] = {}
      redirect_to admin_url
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end
  
  def destroy
    session[:condHash] = nil
    session[:user_id] = nil
    session[:product_id] = nil
    redirect_to admin_url, :notice => "Logged out"
  end

end
