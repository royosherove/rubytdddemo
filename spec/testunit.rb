gem 'minitest'
require 'minitest/autorun'
require '../lib/string_calc'

class TestTheCalc< MiniTest::Test
  def test_add_emptystring_returnsdefaultvalue
    
    result = StringCalculator.new.add("")
    assert_equal 0,result

  end
end
