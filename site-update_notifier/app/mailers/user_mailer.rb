class UserMailer < ActionMailer::Base
  default :from => "from@example.com"

  def registration_confirmation(user)
  	mail to: "to@example.com", subject: "Test"
  end
end
