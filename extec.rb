require JobSearch
fail ArgumentError, "Usage:  Job offers [category]\n" if ARGV.count == 0
category == ARGV[0]

jobs_found = JobSearch::Tecoloco.get_jobs(category)

jobs_fount.each do |title, date, cities, details|
  puts "Earned '#{title}' on #{date}."
end
