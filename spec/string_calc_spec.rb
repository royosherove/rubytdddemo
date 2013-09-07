require 'rspec'
require 'rspec/mocks'
require_relative '../lib/string_calc.rb'

describe StringCalculator do

  describe "Adding" do
    def make_calc
      stub = double("stublogger")
      allow(stub).to receive(:write)
      StringCalculator.new(stub)
    end

    context "given a logger attached" do
      it "calls the logger" do
        logger = double("logger")
        allow(logger).to receive(:write)

        StringCalculator.new(logger).add("")

        expect(logger).to have_received(:write)
      end
    end

    context "negative numbers" do
          it "throws for single number" do
            expect { make_calc.add("-1") }.to raise_error
          end

          it "throws for single number within other numbers" do
            expect { make_calc.add("-1,2") }.to raise_error
          end

          it "throws for several negatives" do
            lambda { make_calc.add("1,-1,-2") }.should raise_error
          end
    end

    context "a single number" do

          it "returns the same number" do
            @calc = make_calc
            expect_that "2",2
          end

          it "returns the same number2" do
            @calc = make_calc
            expect_that "1",1
          end


    end

    context "multiple numbers" do
      it "handles two numbers" do
        @calc = make_calc
        expect_that "1,2",3
      end
      it "handles three numbers" do
        @calc = make_calc
        expect_that "1,2,3",6
      end

    end

    describe "remembers last sum" do
      it "returns the last sum form last operation made" do
        @calc = make_calc
        @calc.add "1"
        @calc.last_sum.should == 1
      end

      it "returns zero if not operations were made" do
        make_calc.last_sum.should == 0
      end
    end

    def expect_that(input,expected)
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
