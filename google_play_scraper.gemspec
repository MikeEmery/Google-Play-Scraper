# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "google_play_scraper/version"

Gem::Specification.new do |s|
  s.name        = "google_play_scraper"
  s.version     = GooglePlayScraper::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mike Emery"]
  s.email       = ["mike@sparq.it"]
  s.homepage    = ""
  s.summary     = "Get Google Play App search results from ruby by scraping their website."
  s.description = "Uses Nokogiri to scrape app search results on the Google Play app search results page.  Returns results as Ruby objects"

  s.rubyforge_project = "google_play_scraper"

  s.files         = Dir["lib/**/*"] + ["Rakefile"]
  s.test_files    = Dir["spec/**/*"]
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency "nokogiri", '>= 1.5.0'
  s.add_dependency 'addressable', '~> 2.3.0'
  s.add_development_dependency 'rspec', '~> 2.14.1'
end
