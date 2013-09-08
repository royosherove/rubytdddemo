require 'mocha/api'
require_relative '../../lib/string_calc.rb'

describe StringCalculator do
  describe "Adding" do
    context "given a logger attached" do
      it "calls the logger faked with mocha" do

        logger = double("logger")
        logger.expects(:write).with("hello").at_least_once

        #StringCalculator.new(logger).add("")

      end
    end

  end
end
