require 'addressable/uri'
require 'net/http'

class GooglePlayScraper::Search
  
  include GooglePlayScraper::SearchOptions
  
  attr_reader :query, :options, :google_play_reachable
  
  GOOGLE_PLAY_SEARCH_URL = GooglePlayScraper::GOOGLE_PLAY_BASE_URL + "/store/search"
  
  DEFAULT_OPTIONS = {
    CATEGORY => 'apps',
    LANGUAGE => 'en',
    APPLY_SORTING => 1, # 0 means no sorting
    SAFE_SEARCH => 0, # apply safesearch to results
    NUMBER_OF_RESULTS => 10 # number of results to display
  }
  
  def initialize(query, options = {})
    @options = DEFAULT_OPTIONS.merge(options)
    @options['q'] = query
    @google_play_reachable = true
  end
  
  def run
    uri = build_uri
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    results = []
    
    begin
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      response.value
    
      parser = GooglePlayScraper::Parser.new(response.body)
      results = parser.results
    rescue
      @google_play_reachable = false
    end
    
    results
  end
  
  def build_uri
    uri = Addressable::URI.parse(GOOGLE_PLAY_SEARCH_URL)
    uri.query_values = options
    uri
  end
end