require 'rspec'
require_relative '../stringcalc.rb'

describe StringCalculator do

  describe "add" do
    def make_calc
      StringCalculator.new
    end

    it "returns the same number for a single number" do
      @calc = make_calc
      @calc.add("1").should == 1
    end

    it "returns the default value for an empty input" do
      @calc = make_calc
      @calc.add("").should == 0
    end
  end
end
