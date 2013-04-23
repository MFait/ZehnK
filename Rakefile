require 'rake'
require 'rspec/core/rake_task'
require 'bundler'

RSpec::Core::RakeTask.new(:test)

task :default do
  puts 'Default task'
end

desc "Runs bundle install"
task :install do
  system %Q(bundle install)
end

desc "Start the app"
task :start => [:install] do
  `bundle exec ruby zehnk.rb`
end

desc "Starts the app - will pickup changes without restarting the server"
task :shotgun => [:install] do
  `bundle exec shotgun -p 4567 zehnk.rb`
end

# desc "setup remote branch for heroku"
task :setup do
  `git remote add heroku git@heroku.com:zehnk.git`
end

# desc "Deploys the app"
task :deploy => [:install, :test] do
  `git push heroku master`
end