require 'clockwork'
require 'whenever'

include Clockwork
include Notifier

handler do |job|
  puts "Running #{job}"
  
end

time = Notifier.set_time 

every(time.seconds, 'notifier.run') {
	puts "UserMailer.my_print"
}