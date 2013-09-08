require_relative '../../lib/string_calc.rb'

describe StringCalculator do
  describe "Adding" do
    context "given a logger attached" do
      it "calls the logger faked with rspecmocks" do

        logger = double()
        allow(logger).to receive(:write)

        StringCalculator.new(logger).add("")

        expect(logger).to have_received(:write).with("got 0")
      end
    end

  end
end
