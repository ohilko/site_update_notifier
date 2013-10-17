class UserMailer < ActionMailer::Base
  default :from => "a@a.com"
  default :to => "o.hilko.27@gmail.com"

  def registration_confirmation(user)
    mail(:subject => "Registered")
  end
end
