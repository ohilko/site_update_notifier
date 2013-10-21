class UserMailer < ActionMailer::Base
  include NotifierHelper

  default :from => "from@example.com"

  def registration_confirmation(user)
  	@user = user
  	mail to: user.email, subject: "Test"
  end

  def notifier_info(user)
  	@user = user
  	@resources = self.write_resources_in_table(user)
  	mail to: user.email, subject: "notifier"
  end
end
