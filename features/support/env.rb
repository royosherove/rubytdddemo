require_relative "../../sinatra/hello"
 
require "capybara"
require "capybara/cucumber"
require "rspec"
World do
      Capybara.app = MyApp
     
      #include RSpec::Matchers
end
