Google Play Store Scraper
========================

This gem allows you to search the Google Play App store by means of scraping the html search results. An example search result can be seen [here][Google Play Search Results]

Usage
=====

Start with:

    gem install google_play_scraper
or

    gem 'google_play_scraper', '~> 0.0.1'
Doing a search

    search = GooglePlayScraper::Search.new('Angry Birds')
    results = search.run # an array of GooglePlayScraper::App

You can customize the results you get back by passing a hash as the second parameter to GooglePlayScraper::Search constructor.

    module GooglePlayScraper
      module SearchOptions
        CATEGORY = :c
        LANGUAGE = :hl
        APPLY_SORTING = :sort
        SAFE_SEARCH = :safe
        NUMBER_OF_RESULTS = :num
      end
    end

    DEFAULT_OPTIONS = {
      CATEGORY => 'apps',
      LANGUAGE => 'en',
      APPLY_SORTING => 1, # 0 means no sorting
      SAFE_SEARCH => 0, # apply safesearch to results
      NUMBER_OF_RESULTS => 10 # number of results to display
    }

Your gem doesn't do __ >:(
======
Create a fork request and provide some kind of rspec test for it - otherwise I might break it accidentially in future.

License
=====
[MIT][MIT License]

  [Google Play Search Results]: https://play.google.com/store/search?q=Angry%20Birds&c=apps&num=10
  [MIT License]: http://opensource.org/licenses/MIT    