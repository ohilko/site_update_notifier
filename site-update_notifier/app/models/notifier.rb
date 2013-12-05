require 'httparty'
require 'date'
require 'clockwork'

include Clockwork

class Notifier 

  def run
    p 'Hello, world!!!'
  end

  def self.parser(user, resource)
  	# UserMailer.notifier_info(user, request.body).deliver
  	# get_time_last_modifier(resource.url)
	  UserMailer.notifier_info(user, get_time_last_modifier(resource.url)).deliver
	  # puts 'Hello' if DateTime.parse(t) < DateTime.parse('12/03/2013')
  
  end


  def self.get_time_last_modifier(url)
  	request = HTTParty.get(url)

  	time_last_modifier = nil
  	massiv_headers = request.headers.inspect.split('{')[1].split('}')[0].split('], ')
 	  for el in massiv_headers
	    if el.split('"last-modified"=>[').length == 2 then
	      time_last_modifier = el.split('"last-modified"=>[')[1]
	      break
	    end
	  end

	  time_last_modifier

  end

end

