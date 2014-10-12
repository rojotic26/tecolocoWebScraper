require './JobSearch'
fail ArgumentError, "Usage:  Job offers [category]\n" if ARGV.count == 0
category = ARGV[0]

jobs_found = JobSearch::Tecoloco.getJobs(category)

jobs_found.each do |title, date, city, detail|
  puts "Job offer:#{title} in #{city} until #{date}."
end
