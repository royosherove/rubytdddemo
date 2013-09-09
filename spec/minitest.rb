require 'test/unit'
require '../lib/string_calc'

class TestTheCalc< Test::Unit::TestCase
  def test_add_emptystring_returnsdefaultvalue
    
    sc = StringCalculator.new
    
    result = sc.add("")

    assert_equal 1,result

  end
end
