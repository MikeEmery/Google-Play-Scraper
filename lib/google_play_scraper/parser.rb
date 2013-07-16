require 'nokogiri'

class GooglePlayScraper::Parser
  
  LOGO_CSS_SELECTOR = '.card-content .cover .cover-image-container .cover-outer-align .cover-inner-align img'
  
  attr_reader :raw_html
  
  def initialize(raw_html)
    @raw_html = raw_html
  end
  
  def results
    doc = Nokogiri::HTML(raw_html)
    
    results = []
    
    doc.css('.card').each do |app_container|
      results << create_app(app_container)
    end
    
    results
  end
  
  def create_app(app_container)
    app = GooglePlayScraper::App.new
    app.logo_url = extract_logo_url(app_container)
    app.logo_url_small = extract_logo_url_small(app_container)
    app.url = extract_app_url(app_container)
    app.id = extract_app_id(app_container)
    app.name = extract_app_name(app_container)
    app.developer = extract_developer(app_container)
    
    app
  end
  
  def extract_developer(app_container)
    span_tag = app_container.css('.card-content .details .subtitle-container .subtitle').first
    span_tag.content
  end
  
  def extract_app_name(app_container)
    a_tag = app_container.css('.card-content .details a.title').first
    a_tag['title']
  end
  
  def extract_app_id(app_container)
    a_tag = app_container.css('.card-content a.card-click-target').first
    uri = Addressable::URI.parse(a_tag['href'])
    uri.query_values['id']
  end
  
  def extract_app_url(app_container)
    a_tag = app_container.css('.card-content a.card-click-target').first
    GooglePlayScraper::GOOGLE_PLAY_BASE_URL + a_tag['href']
  end
  
  def extract_logo_url(app_container)
    img_tag = app_container.css(LOGO_CSS_SELECTOR).first
    img_tag['data-cover-large']
  end
  
  def extract_logo_url_small(app_container)
    img_tag = app_container.css(LOGO_CSS_SELECTOR).first
    img_tag['data-cover-small']
  end
end