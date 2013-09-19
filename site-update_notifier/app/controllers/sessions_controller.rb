class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    
    if user 
      # Sign the user in and redirect to the user's show page.
      session[:user_id] = user.id
      redirect_to root_url, notice: "Signed in!"
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end    
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
end
