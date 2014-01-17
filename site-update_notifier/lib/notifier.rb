require 'rubygems'
require 'bundler'
Bundler.setup(:default, :ci)

require 'active_record'
require 'action_mailer'
require 'clockwork'
require 'httparty'
require 'date'

include Clockwork

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database  => "db/development.sqlite3"
)
ActionMailer::Base.smtp_settings = {
  :address => "127.0.0.1", :port => 1025 
}
ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.prepend_view_path('./')

require File.expand_path('../../app/models/resource', __FILE__)
require File.expand_path('../../app/models/user', __FILE__)
require File.expand_path('../../app/mailers/user_mailer', __FILE__)

module NotifierHelper

  def self.get_information_about_site(url)
    result = Hash.new
    request = HTTParty.get(url)
    puts url

    massiv_headers = request.headers.inspect.split('{')[1].split('}')[0].split('], ')
    for el in massiv_headers
      if el.split('"last-modified"=>[').length == 2 then
        result[:last_modified] = el.split('"last-modified"=>[')[1]
        
      end
      if el.split('"etag"=>[').length == 2 then
        result[:etag] = el.split('"etag"=>[')[1]
        
      end
    end
    
    result

  end

  # send email all users about changer resources 
  def self.send_email(user)
  	UserMailer.notifier_info_empty(user).deliver
  end

  def self.check_update(url, user_id, name)
    result = NotifierHelper.get_information_about_site(url)
    if result[:last_modified] == nil then
      puts 'NIL'
    else
      date = DateTime.parse(result[:last_modified])
      time_now  = DateTime.now
      puts time_now

      puts date.hour
    end  
    
  end
end

resources = Resource.all

resources.each do |resource|

  every(resource.timeout.seconds, 'Resource with name is ' + resource.name + '.') {
    NotifierHelper.check_update(resource.url, resource.user_id, resource.name)
    # NotifierHelper.send_email(User.where(:id => 2))
  }
end
