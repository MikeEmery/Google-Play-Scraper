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
    


Did I Miss An Attribute?
======
Create a fork request and provide some kind of rspec test for it - otherwise I might break it accidentially in future.

License
=====
[MIT][MIT License]

  [Google Play Search Results]: https://play.google.com/store/search?q=Angry%20Birds&c=apps&num=10
  [MIT License]: http://opensource.org/licenses/MIT    