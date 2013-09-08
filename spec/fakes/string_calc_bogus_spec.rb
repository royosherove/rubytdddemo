require 'bogus/rspec'
require_relative '../../lib/slow_logger.rb'
require_relative '../../lib/string_calc.rb'

describe StringCalculator do

  describe "Adding" do

    context "given a logger attached" do
      it "calls the logger faked with bogus" do
        logger = fake(:slow_logger)

        StringCalculator.new(logger).add("")

        logger.should have_received.write("got 0")
      end
    end

  end
end
