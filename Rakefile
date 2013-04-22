require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:test)

task :default do
    puts 'Default task'
end

task :install do
  if ! system %Q(/usr/bin/env RUBYOPT= bundle install)
    raise 'Bundle install failed'
  end
end

task :start do
  ruby 'zehnk.rb'
end

task :shotgun do
   `shotgun -p 4567 zehnk.rb`
end
