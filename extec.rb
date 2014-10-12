require './JobSearch'
fail ArgumentError, "Usage:  Job offers [category]\n" if ARGV.count == 0
category = ARGV[0]

jobs_found = JobSearch::Tecoloco.getJobs(category)

jobs_found.each do |title, date, cities, details|
  puts "Job offer: '#{title}' until #{date}."
end
