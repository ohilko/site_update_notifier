require 'clockwork'
include Clockwork

handler do |job|
  puts "Running #{job}"
  
end

every(5.seconds, 'hello.job')
every(10.seconds, 'less.frequent.job')