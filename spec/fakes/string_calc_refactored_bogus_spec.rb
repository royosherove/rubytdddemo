require 'bogus/rspec'
require_relative '../../lib/web_service'
require_relative '../../lib/slow_logger'
require_relative '../../lib/string_calc_twodeps'
require_relative '../../lib/string_calc_onedep'
require_relative '../../lib/string_calc_with_static'
require_relative '../../lib/shared_logger'


describe StringCalculatorOneDep do
  let(:calc){StringCalculatorOneDep.new(logger)}
  let(:logger) { fake(:slow_logger) }

  describe ".add" do
    def adds_correctly(input,expected)
      calc.add(input).should == expected 
    end
    it { adds_correctly "1", 1 }
    it { adds_correctly "2", 2 }
  end
end
