require 'rspec'
require 'rspec-expectations'
require_relative '../lib/string_calc.rb'

describe StringCalculator do

  describe "Adding" do
    def make_calc
      StringCalculator.new
    end

    context "negative numbers" do
        it "throws for single number" do
          expect { make_calc.add("-1") }.to raise_error
      end
    end
    context "a single number" do

          it "returns the same number" do
            @calc = make_calc
            expect "2",2
          end

          it "returns the same number2" do
            @calc = make_calc
            expect "1",1
          end


    end

    context "multiple numbers" do
      it "handles two numbers" do
        @calc = make_calc
        expect "1,2",3
      end
      it "handles three numbers" do
        @calc = make_calc
        expect "1,2,3",6
      end

    end

    context "last_sum" do
      it "returns the last sum form last operation made" do
        @calc = make_calc
        @calc.add "1"
        @calc.last_sum.should == 1
      end

      it "returns zero if not operations were made" do
        make_calc.last_sum.should == 0
      end
    end

    def expect(input,expected)
      @calc.add(input).should == expected
    end


    context "an empty value" do

      it "returns the default value" do
        @calc = make_calc
        @calc.add("").should == 0
      end
    end
  end
end
