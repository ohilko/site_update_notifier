require 'rubygems'
require 'bundler'
Bundler.setup(:default, :ci)

require 'active_record'
require 'action_mailer'
require 'clockwork'

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
  # @@hash_with_resources = Hash.new 

  # send email all users about changer resources 
  def self.send_email(user)
  	UserMailer.notifier_info_empty(user).deliver
  end

  def self.check_update(time)
    flag = false
    if time == 2
      flag = true
    end 

    flag
  end

  def self.set_information_about_resources
    hash_with_resources = Hash.new
    resources = Resource.all
    # Resource.where(:name => 'google')
    # puts resources

    list_with_name = Array.new
    list_with_url = Array.new
    list_with_timeout = Array.new
    list_with_change = Array.new
    list_with_data_next_check = Array.new
    list_with_user_id = Array.new

    resources.each do |resource|
      list_with_name.push(resource.name)
      list_with_url.push(resource.url)
      list_with_timeout.push(resource.timeout)
      list_with_change.push(resource.change)
      list_with_data_next_check.push(Time.now + resource.timeout * 60)
      list_with_user_id.push(resource.user_id)
    end

    hash_with_resources[:name] = list_with_name
    hash_with_resources[:url] = list_with_url
    hash_with_resources[:timeout] = list_with_timeout
    hash_with_resources[:change] = list_with_change
    hash_with_resources[:date_next_check] = list_with_data_next_check
    hash_with_resources[:user_id] = list_with_user_id

    hash_with_resources
  end
end

hash_with_resources = NotifierHelper.set_information_about_resources

puts hash_with_resources

list = hash_with_resources[:timeout]

# list = [15, 20, 10]
list.each do |element|
  every(element.seconds, 'notifier.run') {
    flag = NotifierHelper.check_update(element)
    if flag
      puts '!!!!'
    else
      puts '????'
    end
    # puts 'Good - ', element
    NotifierHelper.send_email(User.where(:id => 2))
  }
end
