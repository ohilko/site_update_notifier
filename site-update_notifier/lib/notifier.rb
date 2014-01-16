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

  def self.get_time_last_modifier(url)
    request = HTTParty.get(url)
    puts url

    time_last_modifier = nil
    massiv_headers = request.headers.inspect.split('{')[1].split('}')[0].split('], ')
    for el in massiv_headers
      if el.split('"last-modified"=>[').length == 2 then
        time_last_modifier = el.split('"last-modified"=>[')[1]
        break
      end
    end
    puts time_last_modifier

    time_last_modifier

  end

  # send email all users about changer resources 
  def self.send_email(user)
  	UserMailer.notifier_info_empty(user).deliver
  end

  def self.check_update(url, user_id, name)
    time_last_modifier = NotifierHelper.get_time_last_modifier(url)
    date = DateTime.parse(time_last_modifier)

    time_now  = DateTime.now
    puts time_now

    puts date.hour
    # puts time_last_modifier
  end

  # def self.set_information_about_resources
  #   hash_with_resources = Hash.new
  #   resources = Resource.all

  #   list_with_name = Array.new
  #   list_with_url = Array.new
  #   list_with_timeout = Array.new
  #   list_with_change = Array.new
  #   list_with_data_next_check = Array.new
  #   list_with_user_id = Array.new

  #   resources.each do |resource|
  #     list_with_name.push(resource.name)
  #     list_with_url.push(resource.url)
  #     list_with_timeout.push(resource.timeout)
  #     list_with_change.push(resource.change)
  #     list_with_data_next_check.push(Time.now + resource.timeout * 60)
  #     list_with_user_id.push(resource.user_id)
  #   end

  #   hash_with_resources[:name] = list_with_name
  #   hash_with_resources[:url] = list_with_url
  #   hash_with_resources[:timeout] = list_with_timeout
  #   hash_with_resources[:change] = list_with_change
  #   hash_with_resources[:date_next_check] = list_with_data_next_check
  #   hash_with_resources[:user_id] = list_with_user_id

  #   hash_with_resources
  # end
end

resources = Resource.all

resources.each do |resource|

  every(resource.timeout.seconds, 'Resource with name is ' + resource.name + '.') {
    NotifierHelper.check_update(resource.url, resource.user_id, resource.name)
    # NotifierHelper.send_email(User.where(:id => 2))
  }
end
