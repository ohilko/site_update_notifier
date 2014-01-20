class UserMailer < ActionMailer::Base

  default :from => "from@example.com"

  def registration_confirmation(user)
  	@user = user
  	mail to: user.email, subject: "Test"
  end

  def notifier_info(user)
  	@user = user
  	# @resources = self.write_resources_in_table(user)
  	# @resources = hash_with_resources
    mail to: user.email, subject: "notifier"
  end

  def notifier_info_empty(user)
    @user = user

    mail(to: user.email, subject: "notifier", template_path: 'app/views/user_mailer', template_name: 'notifier_info_empty')
  end

  def my_print
    puts 'Work'
  end
end
