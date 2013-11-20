class Scraper
  require 'HTTParty'
  require 'nokogiri'
  attr_accessor :url


  def initialize(url)
    @url = url
  end

  def get_hrefs
    hrefs_arr = []
    response = HTTParty.get(@url)
    doc = Nokogiri::HTML(response)
    # hrefs = doc.css('.Text')
      # hrefs.each do |link|
      #  hrefs_arr << link.text
      # end
    links = doc.css('a')
      links.each do |link|
        hrefs_arr << link["href"]
      end
    hrefs_arr
  end

end


#     links = doc.css('a')
#     binding.pry
#     links.map { |link| @hrefs << link['href'] }
#     @hrefs
#   end
# end
