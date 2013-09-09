require 'bogus/rspec'
require_relative '../lib/web_service'
require_relative '../lib/slow_logger'
require_relative '../lib/string_calc'
require_relative '../lib/log_string_formatter_after'
require 'timecop'

describe LogStringFormatterAfter do

  context "in the year 2000" do
    it "logs the correct time" do
      Timecop.freeze(Time.mktime(2000, 1, 1, 11, 11)) do 
        result =  LogStringFormatterAfter.format("text")
        result.should == "2000-01-01 11:11:00 +0100 text"
      end

    end
  end

end
