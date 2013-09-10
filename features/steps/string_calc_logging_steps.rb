require_relative '../../lib/web_service.rb'
require_relative '../../lib/slow_logger.rb'
require_relative '../../lib/string_calc.rb'
  class FakeLogger
    attr_accessor :numbers, :will_throw
    def write(text)
      @numbers = text
      raise @will_throw if @will_throw
    end
  end
  
  class FakeWebService
    attr_accessor :text
    def write(text)
      @text = text
    end
  end
Given(/^a string calculator$/) do
end

Given(/^a slow logger instance$/) do
  @logger = FakeLogger.new
  @calc = StringCalculator.new(@logger,FakeWebService.new)
end

When(/^the string calculator add method is called with input  "(\d+),(\d+)"$/) do |arg1, arg2|
  @calc.add("#{arg1},#{arg2}")
end

Then(/^slow logger should be notified with "(.+)"$/) do |arg1|
    @logger.numbers.should == arg1
end

