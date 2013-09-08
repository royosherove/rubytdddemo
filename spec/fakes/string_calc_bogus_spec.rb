require 'bogus/rspec'
require_relative '../../lib/web_service.rb'
require_relative '../../lib/slow_logger.rb'
require_relative '../../lib/string_calc_twodeps.rb'
require_relative '../../lib/string_calc_onedep.rb'

describe StringCalculatorOneDep do

  describe "Adding" do

    context "given a logger attached" do
      it "calls the logger faked with bogus" do
        logger = fake(:slow_logger)
        fakews = fake(:web_service)

        StringCalculatorOneDep.new(logger,fakews).add("")

        logger.should have_received.write("got 0")
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

        logger.should have_received.write("got 0")
      end
    end

    context "given a logger and a web service" do
      context "when the logger throws an exception" do
        it "notifies the web service" do

          logger = fake(write: proc{raise "nooo"})
          fakews = fake(:web_service)

          StringCalculatorTwoDeps.new(logger,fakews).add("")

          fakews.should have_received.notify("logger threw up")

        end
      end
    end

  end
end
