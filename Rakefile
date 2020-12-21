require_relative './config/environment'

puts "Welcome to Chart Library"

def reload!
  load './lib/song.rb'
  load './lib/artist.rb'
  load './lib/genre.rb'
  load './lib/arrangement.rb'
  load './lib/arranger.rb'
  load './lib/chart.rb'
end

desc "A console"
task :console do
  Pry.start
end
