class StringCalculator
  attr_accessor :last_sum
  def initialize()
    @last_sum = 0
  end

  def add(numbers)
    @last_sum = calculate(numbers)
    @last_sum
  end

  def calculate(numbers)
    return 0 if numbers==""

    return numbers.to_i unless numbers.include? ","

    numbers.split(",")
    .map{|x|x.to_i}
    .inject(:+)
  end
end
