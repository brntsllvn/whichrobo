desc "This task is called by the Heroku scheduler add-on"
task :make_bacon => :environment do
  puts "Updating feed..."
  puts "done."
end

task :send_reminders => :environment do
end