require 'open-uri'
require 'pry'

class Scraper
  
  def self.scrape_index_page(index_url)
    student_hashes = []
    document = Nokogiri(open(index_url))
    document.css(".student-card").each { |card|
      student_hashes << { name: card.css(".student-name").text,
                          location: card.css(".student-location").text,
                          profile_url: card }
    }
    pp student_hashes
  end
  
  def self.scrape_profile_page(profile_url)
    
  end
  
end
