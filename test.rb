require "./stringcalc.rb"
require 'test/unit'
  

class StringCalculatorTests < Test::Unit::TestCase

	def test_add_withSingleNumber_ReturnsThatNumber
		sc = StringCalculator.new
		assert_equal 1, sc.add("1")
	end

	def test_add_withEmptyString_returnsZero
		sc = StringCalculator.new
		assert_equal 0, sc.add("")
	end
  
end