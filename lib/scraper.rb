require 'open-uri'
require 'pry'

class Scraper
  
  def self.scrape_index_page(index_url)
    hash = Nokogiri::HTML(open-uri("https://learn-co-curriculum.github.io/student-scraper-test-page/"))
  end
  
  def self.scrape_profile_page(profile_url)
    
  end
  
end
