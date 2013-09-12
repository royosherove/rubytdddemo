require_relative '../../lib/web_service.rb'
require_relative '../../lib/slow_logger.rb'
require_relative '../../lib/string_calc.rb'
require 'bogus'

Given(/^a string calculator$/) do
end

Given(/^a slow logger instance$/) do
  @logger = fake(:slow_logger)
  @calc = StringCalculator.new(@logger,fake(:web_service))
end

When(/^the string calculator add method is called with input  "(\d+),(\d+)"$/) do |arg1, arg2|
  @calc.add("#{arg1},#{arg2}")
end

Then(/^slow logger should be notified with "(.+)"$/) do |arg1|
    @logger.numbers.should == arg1
end

