class StringCalculator
  attr_accessor :last_sum
  def initialize(thelogger)
    @last_sum = 0
    @logger = thelogger
  end

  def add(numbers)
    raise "only positives please!" if numbers.include?("-")
    @last_sum = calculate(numbers)
    @logger.write("got #{@last_sum}")
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
