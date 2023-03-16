class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If user exists + password is right
    if user && user.authenticate(params[:password])
      # We are going to save user id inside the browser cookies. This way user stays logged in as the navigate our website
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
