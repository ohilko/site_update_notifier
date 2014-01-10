# require File.expand_path('../../app/views/user_mailer/notifier_info_empty.html.erb', __FILE__)

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

    mail(to: "to@example.com", subject: "notifier") do |format|
      format.html { render user_mailer: 'notifier_info_empty.html.erb'}
    end
  end

  def my_print
    puts 'Work'
  end
end
