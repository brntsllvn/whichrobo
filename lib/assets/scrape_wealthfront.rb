# https://devcenter.heroku.com/articles/scheduler

# ruby lib/tasks/scrape_wealthfront.rb

# require 'mechanize'

agent = Mechanize.new

page = mechanize.get('http://stackoverflow.com/')

puts page.title