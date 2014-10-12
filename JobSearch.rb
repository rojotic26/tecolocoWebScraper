require 'nokogiri'
require 'open-uri'
module JobSearch
class Tecoloco
TITLE_JOB = "//div[@class = 'plaza']//a[@class = 'oferta-trabajo']"
CITY_JOB = "//div[@class = 'plaza']//span[@class = 'ciudad-trabajo']"
DATE_JOB = "//div[@class = 'plaza']//div[@class = 'vigencia-trabajo']"
DETAIL_JOB = "//div[@class = 'plaza']//span[@class = 'detalle-trabajo']"
def self.getJobs(category)
  doc = get_html(category)
  titles = get_titles(doc)
  dates = get_dates(doc)
  cities = get_cities(doc)
  details = get_details(doc)
  integrate (titles,dates, cities, details)
end

