require 'rspec'
require_relative '../stringcalc.rb'

describe StringCalculator do

  describe "add" do
    def make_calc
      StringCalculator.new
    end

    context "single number" do

      it "returns the same number for a single number2" do
        @calc = make_calc
        expect "2",2
      end

      it "returns the same number for a single number" do
        @calc = make_calc
        expect "1",1
      end
    end

    def expect(input,expected)
      @calc.add(input).should == expected
    end


    it "returns the default value for an empty input" do
      @calc = make_calc
      @calc.add("").should == 0
    end
  end
end
