class UserMailer < ActionMailer::Base
  default :from => "from@example.com"

  def registration_confirmation(user)
  	mail to: user.email, subject: "Test"
  end
end
