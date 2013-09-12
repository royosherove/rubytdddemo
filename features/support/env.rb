require_relative "../../sinatra/hello"
 
require "capybara"
require "capybara/cucumber"
require "rspec"
require 'bogus'
require 'bogus/rspec'
World do
      Capybara.app = MyApp
end
