require 'rspec'
require_relative 'stringcalc.rb'


describe "something" do
  it "should do something" do
		sc = StringCalculator.new
    sc.add("").should == 0 
  end
end

