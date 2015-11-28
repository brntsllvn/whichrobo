# https://devcenter.heroku.com/articles/scheduler

# ruby lib/assets/scrape_wealthfront.rb

require 'mechanize'

agent = Mechanize.new

@page = agent.get('http://stackoverflow.com/')

@page.title