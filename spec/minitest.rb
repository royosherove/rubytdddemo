require 'test/unit'
require '../lib/string_calc'

class TestTheCalc< Test::Unit::TestCase
  def test_add_emptystring_returnsdefaultvalue
    
    result = StringCalculator.new.add("")
    assert_equal 0,result

  end
end
