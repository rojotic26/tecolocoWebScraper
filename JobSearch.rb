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
  
  def self.getHtml(category)
   url = "#{URL}/#{category}"
  end

  # Function to obtain the titles of the job offers at tecoloco
  def self.get_titles(document)
    titles = document.xpath(TITLE_JOB) 
    titles.map { |t| t.text }
  end





