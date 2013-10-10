class UserMailer < ActionMailer::Base
  default from: 'notifications@example.com'
 
  def welcome_email(user)
    mail(to: 'o.hilko.27@gmail.com', subject: 'Welcome to My Awesome Site')
  end

  def contact(recipient, subject, message, sent_at = Time.now)
      @subject = subject
      @recipients = recipient
      @from = 'no-reply@yourdomain.com'
      @sent_on = sent_at
	    @body["title"] = 'This is title'
  	  @body["email"] = 'sender@yourdomain.com'
   	  @body["message"] = message
      @headers = {}
   end

end
