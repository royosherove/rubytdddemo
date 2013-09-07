#NO CHANGES DETECTED BY RSPEC? NO. 
class StringCalculator
	def add(numbers)
    return 0 if numbers==""

		return numbers.to_i unless numbers.include? ","

    nums = numbers.split(",")

    nums.first.to_i + nums.second.to_i
	end
end
