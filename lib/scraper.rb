require 'open-uri'
require 'pry'

class Scraper
  
  def self.scrape_index_page(index_url)
    student_hashes = []
    document = Nokogiri::HTML(open(index_url))
    document.css(".student-card").each { |card|
      student_hashes << { name: card.css(".student-name").text,
                          location: card.css(".student-location").text,
                          profile_url: card.xpath("a/@href").text }
    }
    return student_hashes
  end
  
  def self.scrape_profile_page(profile_url)
    student_profile_hash = {}
    document = Nokogiri::HTML(open(profile_url))
    links = document.css(".social-icon-container a")
    links.each { |link|
      student_profile_hash[:twitter] = link.xpath("@href").text if link.xpath("@href").text.include?("twitter")
      student_profile_hash[:linkedin] = link.xpath("@href").text if link.xpath("@href").text.include?("linkedin")
    }
    pp student_profile_hash
  end
  
end
