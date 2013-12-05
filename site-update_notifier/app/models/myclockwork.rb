require 'clockwork'

include Clockwork

class MyClockwork
	
	# include NotifierHelper

	time = 10

	handler do |job|
  		puts "Running #{job}"
	end

	def self.set_time
		# NotifierHelper.set_time()
		15
	end

	time = self.set_time

end

every(MyClockwork.set_time.seconds, 'notifier.run') {
		puts "Good"
	}