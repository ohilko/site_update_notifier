require 'clockwork'
require 'whenever'

include Clockwork

time = 10

handler do |job|
  puts "Running #{job}"
end

def self.set_time
	# Notifier.set_time
	15
end

time = self.set_time

every(time.seconds, 'notifier.run') {
	puts "Good"
}