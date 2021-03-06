require_relative '../../lib/web_service.rb'
require_relative '../../lib/slow_logger.rb'
require_relative '../../lib/string_calc.rb'
require 'bogus'

class FakeWebService
  def write(something)

  end
end
class FakeLogger
  attr_accessor :numbers
  def write(something)
    @numbers = something
  end
end
Given(/^a string calculator$/) do
end

Given(/^a slow logger instance$/) do
end

When(/^the string calculator add method is called with input  "(\d+),(\d+)"$/) do |arg1, arg2|
  @logger = FakeLogger.new
  @calc = StringCalculator.new(@logger,FakeWebService.new)
  @calc.add("#{arg1},#{arg2}")
end

Then(/^slow logger should be notified with "(.+)"$/) do |arg1|
    @logger.numbers.should == arg1
end

