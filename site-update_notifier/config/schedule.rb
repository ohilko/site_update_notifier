require 'clockwork'
include Clockwork

handler do |job|
  puts "Running #{job}"
  
end


every(30.seconds, 'notifier.run') {
	p 'Olga'
}