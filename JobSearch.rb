require 'nokogiri'
require 'open-uri'
module JobSearch
  # This class get the category of jobs you are looking for and
  # return a hash of job offers information.
  class Tecoloco
    # Variables
    TITLE_JOB = "//div[@class = 'plaza']//a[@class = 'oferta-trabajo']"
    CITY_JOB = "//div[@class = 'plaza']//span[@class = 'ciudad-trabajo']"
    DATE_JOB = "//div[@class = 'plaza']//div[@class = 'vigencia-trabajo']"
    DETAIL_JOB = "//div[@class = 'plaza']//span[@class = 'detalle-trabajo']"
    URL_TECOLOCO = 'http://www.tecoloco.com/empleo-'

    # Function to obtain the whole information of the job offers at tecoloco
    def self.getjobs(category)
      doc = gethtml(category)
      titles = get_titles(doc)
      dates = get_dates(doc)
      cities = get_cities(doc)
      details = get_details(doc)
      integrate(titles, dates, cities, details)
    end

    # Function to get the url of tecoloco
    def self.gethtml(category)
      url = "#{URL_TECOLOCO}#{category}"
      Nokogiri::HTML(open(url))
    end

    # Function to obtain the titles of the job offers at tecoloco
    def self.get_titles(document)
      titles = document.xpath(TITLE_JOB)
      titles.map { |t| t.text }
    end

    # Function to obtain dates of the job offers at tecoloco
    def self.get_dates(document)
      dates = document.xpath(DATE_JOB)
      dates.map { |d| Date.parse(d) }
    end

    # Function to obtain the cities of the job offers at tecoloco
    def self.get_cities(document)
      cities = document.xpath(CITY_JOB)
      cities.map { |c| c.text }
    end

    # Function to obtain details of the job offers at tecoloco
    def self.get_details(document)
      details = document.xpath(DETAIL_JOB)
      details.map { |dt| dt.text }
    end

    # Function to integrate the data of job offers in a hash by category
    def self.integrate(titles, dates, cities, details)
      jobs_array = titles.each_with_index.map do |_, index, _, _|
        [titles[index], dates[index], cities[index], details[index]]
      end
      jobs_array
    end
  end
end
