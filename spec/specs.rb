require 'rspec'
require_relative '../lib/string_calc.rb'


describe "something" do
  it "should do something" do
		sc = StringCalculator.new
    sc.add("").should == 0 
  end
end

