class StringCalculator
  attr_accessor :last_sum

  def add(numbers)
    raise "only positives please!" if numbers.include?("-")
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
