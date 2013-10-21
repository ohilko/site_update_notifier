module NotifierHelper
  
  # send email all users about changer resources 
  def send_email(user)
  	UserMailer.registration_confirmation(current_user).deliver
  end
  
  # list of resources which change
  def change_resources(user)
  	user.resources
  end

  # write resources in table, it is very easy for use
  def write_resources(user)
  	resources = Resource.all
  	
  	hash_with_resources = Hash.new

  	list_with_name = Array.new
  	list_with_url = Array.new
  	list_with_timeout = Array.new
  	list_with_change = Array.new
  	list_with_data_next_check = Array.new

  	resources.each do |resource|
  		list_with_name.push(resource.name)
  		list_with_url.push(resource.url)
  		list_with_timeout.push(resource.timeout)
  		list_with_change.push(resource.change)
  		list_with_data_next_check.push(Time.now + resource.timeout * 60)
  	end

  	hash_with_resources[:name] = list_with_name
  	hash_with_resources[:url] = list_with_url
  	hash_with_resources[:timeout] = list_with_timeout
  	hash_with_resources[:change] = list_with_change
  	hash_with_resources[:date_next_check] = list_with_data_next_check

    hash_with_resources
    # date next check this resource
  	# date_next_check = Time.now + resource.timeout * 60
  end


end