require 'open-uri'
require 'pry'

class Scraper

<<<<<<< HEADL
  def self.scrape_index_page(index_url)
    html = Nokogiri::HTML(open(index_url))
    students = html.css(".student-card a")
    students.collect do |element|
=======
attr_accessor :html  

  def get_page(index_url)
    html = Nokogiri::HTML(open('https://learn-co-curriculum.github.io/student-scraper-test-page/'))
  end
  
  def get_students
    students = self.get_page.css(".student-card a")
  end
    
  def self.scrape_index_page
    self.get_students.collect do |element|
>>>>>>> e4e4a4b28236c73598b392b08d295fdbee99d13c
      {:name => element.css(".student-name").text ,
        :location => element.css(".student-location").text,
        :profile_url => element.attr('href')
      }
    end
  end

  def self.scrape_profile_page(profile_url)
    html = Nokogiri::HTML(open(profile_url))
    profile_container = {}
    media = html.css(".vitals-container .social-icon-container a")
    
    media.each do |element|
      if element.attr('href').include?("twitter")
        profile_container[:twitter] = element.attr('href')
      elsif element.attr('href').include?("linkedin")
        profile_container[:linkedin] = element.attr('href')
      elsif element.attr('href').include?("github")
        profile_container[:github] = element.attr('href')
      elsif element.attr('href').include?("youtube")
        profile_container[:youtube] = element.attr('href')
      elsif element.attr('href').include?("facebook")
        profile_container[:facebook] = element.attr('href')
      else 
          profile_container[:blog] = element.attr('href')
      end
    end
      
    profile_container[:profile_quote] = html.css(".vitals-container .vitals-text-container .profile-quote").text
    profile_container[:bio] = html.css(".bio-block.details-block .bio-content.content-holder .description-holder p").text

    profile_container
  end
end

