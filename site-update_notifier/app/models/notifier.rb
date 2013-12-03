require 'httparty'

class Notifier < ActiveRecord::Base

  def run
    p 'Hello, world!!!'
  end

  def self.parser(user, url)
  	request = HTTParty.get(url)

  	# puts request.body
  	UserMailer.notifier_info(user, request.body).deliver
  	puts request.headers.inspect.split('"last-modified"=>["')[1].split('"]')[0]
  	puts request.headers.inspect.split('{')[1].split('}')[0].split(', ')
  	massiv_headers[0].split('"accept-ranges"=>[')

  	# massiv_headers = request.headers.inspect.split('{')[1].split('}')[0].split('], ')
 	# for el in massiv_headers
	#   if el.split('"last-modified"=>[').length == 2 then
	#     puts 'Hello!!!!!'
	#   end
	# end

  end
end