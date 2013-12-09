require 'rubygems'
require 'bundler'
Bundler.setup(:default, :ci)

require 'clockwork'
require '/home/ohilko/Work_ruby/site_update_notifier/site-update_notifier/app/models/resource.rb'

include Clockwork

module NotifierHelper
  # @@hash_with_resources = Hash.new 

  # # send email all users about changer resources 
  # def send_email(user)
  # 	UserMailer.notifier_info(user, @@hash_with_resources).deliver
  # end

  # # list of resources which change
  # def resources_of_change(user)
  # 	user.resources
  # end

  # # add new resource in table, which must to have information about all resources
  # def add_resource_in_table(resource)
  # 	@@hash_with_resources[:name].push(resource.name)
  #   @@hash_with_resources[:url].push(resource.url)
  #   @@hash_with_resources[:timeout].push(resource.timeout)
  #   @@hash_with_resources[:change].push(resource.change)
  #   @@hash_with_resources[:date_next_check].push(Time.now + resource.timeout * 60)
  # end

  # # write resources in table, it is very easy for use
  # def write_resources_in_table(user)
  # 	resources = Resource.all


  # 	list_with_name = Array.new
  # 	list_with_url = Array.new
  # 	list_with_timeout = Array.new
  # 	list_with_change = Array.new
  # 	list_with_data_next_check = Array.new

  # 	resources.each do |resource|
  # 		list_with_name.push(resource.name)
  # 		list_with_url.push(resource.url)
  # 		list_with_timeout.push(resource.timeout)
  # 		list_with_change.push(resource.change)
  # 		list_with_data_next_check.push(Time.now + resource.timeout * 60)
  # 	end

  # 	@@hash_with_resources[:name] = list_with_name
  #   @@hash_with_resources[:url] = list_with_url
  # 	@@hash_with_resources[:timeout] = list_with_timeout
  # 	@@hash_with_resources[:change] = list_with_change
  # 	@@hash_with_resources[:date_next_check] = list_with_data_next_check

  #   @@hash_with_resources
  # end

  def self.set_information_about_resources
    hash_with_resources = Hash.new
    resources = Resource.all


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

list = hash_with_resources[:timeout]

# list = [15, 20, 10]
list.each do |element|
  every(element.seconds, 'notifier.run') {
    puts "Good - ", element
  }
end
