require 'rake'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

 
RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = './spec/string_calc_spec.rb'
    t.rspec_opts = "--format doc"
end

Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "features/sinatra.feature --format pretty"
end

task :default  => [:spec, :features]