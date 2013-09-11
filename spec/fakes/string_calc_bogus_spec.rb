require 'bogus/rspec'
require_relative '../../lib/web_service'
require_relative '../../lib/slow_logger'
require_relative '../../lib/string_calc_twodeps'
require_relative '../../lib/string_calc_onedep'
require_relative '../../lib/string_calc_with_static'
require_relative '../../lib/shared_logger'

class FakeSlowLogger
  attr_accessor :numbers, :will_throw
  def write(numbers)
    @numbers = numbers
    raise @will_throw if @will_throw
  end
end

class FakeWebService
  attr_accessor :text
  def write(text)
    @text = text
  end
end

describe StringCalculatorOneDep do

  describe "Adding" do

    context "given a logger attached hand written" do
      it "calls the logger" do
        logger = FakeSlowLogger.new

        StringCalculatorOneDep.new(logger).add("1")

        logger.numbers.should == "got 1"
      end
    end

    context "given a throwing logger and web service" do
      it "calls the web service " do
        logger = FakeSlowLogger.new
        logger.will_throw = "fake error"
        webservice = FakeWebService.new

        StringCalculatorOneDep.new(logger,webservice).add("1")

        webservice.numbers.should == "got 'fake error'"
      end
    end

    context "given a logger attached" do
      it "calls the logger faked with bogus" do
        logger = fake(:slow_logger)
        fakews = fake(:web_service)

        StringCalculatorOneDep.new(logger).add("1")

        logger.should have_received.write(with {|text| text.include?("got 1")})
      end
    end


  end
end




describe StringCalculatorTwoDeps do

  describe "Adding" do

    context "given a logger attached" do
      it "calls the logger faked with bogus" do
        logger = fake(:slow_logger)
        fakews = fake(:web_service)

        StringCalculatorTwoDeps.new(logger,fakews).add("")

        logger.should have_received.write(with {|text| text.include?("got 0")})
      end
    end

    context "given a logger and a web service" do
      context "when the logger throws an exception" do
        it "notifies the web service" do

          logger = fake(write: proc{raise "nooo"})
          fakews = fake(:web_service)

          calc = StringCalculatorTwoDeps.new(logger,fakews)
          calc.add("")

          fakews.should have_received.notify(with {|s| s.include?("logger threw up")})

        end
      end
    end

  end
end





describe StringCalculatorWithStatic do

  describe "Adding" do

    context "given a logger attached hand written" do
      it "calls the logger faked with bogus" do
        fake_class SharedLogger

        StringCalculatorWithStatic.new.add("1")

        SharedLogger.should have_received.write("got 1")
      end
    end
  end
end
