class IdentitiesController < ApplicationController
  
  def new
    @identity = env['omniauth.identity']
  end

  def send_email(user)
  	UserMailer.registration_confirmation(current_user).deliver
  end
end
