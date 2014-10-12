require 'nokogiri'
require 'open-uri'
module JobSearch
class Tecoloco
  
  # Variables
  TITLE_JOB = "//div[@class = 'plaza']//a[@class = 'oferta-trabajo']"
  CITY_JOB = "//div[@class = 'plaza']//span[@class = 'ciudad-trabajo']"
  DATE_JOB = "//div[@class = 'plaza']//div[@class = 'vigencia-trabajo']"
  DETAIL_JOB = "//div[@class = 'plaza']//span[@class = 'detalle-trabajo']"

  URL = 'http://www.tecoloco.com'
  
  # Function to obtain the whole information of the job offers at tecoloco
  def self.getJobs(category)
   doc = get_html(category)
   titles = get_titles(doc)
   dates = get_dates(doc)
   cities = get_cities(doc)
   details = get_details(doc)
   integrate (titles,dates, cities, details)
  end
  
  # Function to get the url of tecoloco
  def self.getHtml(category)
   url = "#{URL}/#{category}"
  end

  # Function to obtain the titles of the job offers at tecoloco
  def self.get_titles(document)
   titles = document.xpath(TITLE_JOB) 
   titles.map { |t| t.text }
  end

  # Function to obtain dates of the job offers at tecoloco

  def self.get_dates(document)
   dates = document.xpath(DATE_XPATH)
   dates.map { |d| Date.parse(d) }
  end

  # Function to integrate the data of job offers in a hash by category
  def self.integrate(titles,dates,cities,details)
    jobs_array = titles.each_with_index.map do |_,index|
      [titles[index], dates[index], cities[index], details[index]]
    end
    Hash[jobs_array]
  end

end
