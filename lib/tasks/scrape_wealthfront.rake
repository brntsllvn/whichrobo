desc "This task is called by the Heroku scheduler add-on"
task :scrape_wf => :environment do
  puts "Updating feed..."
  NewsFeed.update
  puts "done."
end
