require 'bogus/rspec'
require_relative '../lib/web_service.rb'
require_relative '../lib/slow_logger.rb'
require_relative '../lib/string_calc.rb'

describe StringCalculator do

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

  subject(:calc){StringCalculator.new(logger, webservice)}
  let(:logger){FakeLogger.new}
  let(:webservice){FakeWebService.new}
  describe "Adding" do
    it "calls the logger with the sum" do
      calc.add("1")
      logger.numbers.should == "got 1"
    end

    context "with a logger that throws and a webservice" do
      it "calls the web service with the logger error" do
        fakelogger = FakeLogger.new
        fakelogger.will_throw = "fake error"
        webservice = FakeWebService.new

        StringCalculator.new(fakelogger, webservice).add("1")

        webservice.text.should == "got 'fake error'"
      end
    end
    context "negative numbers" do

          it "throws for single number" do
            expect { calc.add("-1") }.to raise_error
          end

          it "throws for single number within other numbers" do
            expect { calc.add("-1,2") }.to raise_error
          end

          it "throws for several negatives" do
            lambda { calc.add("1,-1,-2") }.should raise_error
          end
    end

    context "a single number" do

          it "returns the same number" do
            expect_that "2",2
          end

          it "returns the same number2" do
            expect_that "1",1
          end


    end

    context "multiple numbers" do
      it "handles two numbers" do
        expect_that "1,2",3
      end
      it "handles three numbers" do
        expect_that "1,2,3",6
      end

    end

    describe "remembers last sum" do
      it "returns the last sum form last operation made" do
        calc.add "1"
        calc.last_sum.should == 1
      end

      it "returns zero if not operations were made" do
        calc.last_sum.should == 0
      end
    end

    def expect_that(input,expected)
      calc.add(input).should == expected
    end


    context "an empty value" do

      it "returns the default value" do
        calc.add("").should == 0
      end
    end
  end
end
