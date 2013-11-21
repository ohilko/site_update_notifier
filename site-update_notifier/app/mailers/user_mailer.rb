class UserMailer < ActionMailer::Base
  include NotifierHelper

  default :from => "from@example.com"

  def registration_confirmation(user)
  	@user = user
  	mail to: user.email, subject: "Test"
  end

  def notifier_info(user, hash_with_resources)
  	@user = user
  	# @resources = self.write_resources_in_table(user)
  	@resources = hash_with_resources
    mail to: user.email, subject: "notifier"
  end
end
