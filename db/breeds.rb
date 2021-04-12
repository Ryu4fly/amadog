require 'Nokogiri'

breed_html = Rails.root.join('db', 'data', 'breeds', 'breeds.html')

BREEDS = []

def scraper(html)
  html_file = File.open(html).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.list-item-title').each do |breed|
    BREEDS.push(breed.content)
  end
end

scraper(breed_html)
