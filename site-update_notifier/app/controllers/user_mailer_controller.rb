class UserMailer < ActionMailer::Base
  default :from => "a@a.com"

  def registration_confirmation(user)
    mail(:to => user.email, :subject => "Registered")
  end
end