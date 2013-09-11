require 'rspec'
require 'bogus'
require 'bogus/rspec'
require_relative '../../lib/web_service'
require_relative '../../lib/slow_logger'
require_relative '../../lib/string_calc_twodeps'
require_relative '../../lib/string_calc_onedep'
require_relative '../../lib/string_calc_with_static'
require_relative '../../lib/shared_logger'


describe StringCalculatorTwoDeps do
  subject(:calc){StringCalculatorTwoDeps.new(logger,webservice)}
  let(:logger) { fake(:slow_logger) }
  let(:webservice) { fake(:web_service) }

  describe ".add" do
    def adding(input)
      calc.add(input)
    end

    specify { adding("1").should == 1 }
    specify { adding("2").should == 2 }

    context "with a logger that throws" do
      let(:logger){ fake(:slow_logger, write: proc { raise "BAM" }) }
      before  { adding("") }
      subject { webservice }
      it      { should have_received.notify(any_args) }
    end
  end
end
