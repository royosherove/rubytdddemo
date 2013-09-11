require 'bogus/rspec'
require_relative '../lib/web_service.rb'
require_relative '../lib/slow_logger.rb'
require_relative '../lib/string_calc.rb'

describe StringCalculator do

  subject(:calc) { StringCalculator.new(logger,webservice) }
  let(:logger) {fake(:slow_logger)}
  let(:webservice) {fake(:web_service)}


  describe "Adding" do
      def adding(input)
        calc.add(input)
      end

    context "with a logger" do
      it "calls the logger with the sum" do
        adding("1")
        logger.should have_received.write(any_args)
      end
    end

    context "with a logger that throws and a webservice" do
      let(:logger) { fake(:slow_logger, write: proc { raise "BAM" }) }

      it "calls the web service with the logger error" do
        calc.add("1")
        webservice.should have_received.notify(any_args)
      end
    end

    context "negative numbers" do
      specify { expect { adding("-1") }.to raise_error }
      specify { expect { adding("-1,2") }.to raise_error }
      specify { expect { adding("-1,-1,-2") }.to raise_error }
    end

    context "a single number" do

      specify {adding("2").should == 2}
      specify {adding("1").should == 1}

    end

    context "multiple numbers" do
      specify {adding("1,2").should == 3}
      specify {adding("1,2,3").should == 6}
    end

    describe "remembers last sum" do
      def add_and_Get_last_sum(input)
        calc.add(input)
        calc.last_sum
      end

      its {last_sum.should == 0}
      specify { add_and_Get_last_sum("1").should == 1 }
      specify { add_and_Get_last_sum("1,2").should == 3 }
    end


    context "an empty value" do
      specify { adding("").should == 0 }
  end
end
end
