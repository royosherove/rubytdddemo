require 'bogus/rspec'
require_relative '../lib/web_service.rb'
require_relative '../lib/slow_logger.rb'
require_relative '../lib/string_calc.rb'

describe StringCalculator do

  describe "Adding" do
    let(:calc){StringCalculator.new}

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
