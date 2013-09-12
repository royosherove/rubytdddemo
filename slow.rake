require 'rake'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

 

Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "features/sinatra.feature --format pretty"
end

task :default  => [ :features]
