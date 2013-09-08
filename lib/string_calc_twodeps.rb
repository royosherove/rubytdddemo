class StringCalculatorTwoDeps
  attr_accessor :last_sum
  def initialize(thelogger,thewebserice)
    @last_sum = 0
    @logger = thelogger
    @webservice = thewebserice
  end

  def add(numbers)
    raise "only positives please!" if numbers.include?("-")
    @last_sum = calculate(numbers)
    notify_logger
    @last_sum
  end

  def notify_logger
    begin
      @logger.write("got #{@last_sum}")
    rescue
      @webservice.notify("logger threw up")
    end
  end

  def calculate(numbers)
    return 0 if numbers==""

    return numbers.to_i unless numbers.include? ","

    numbers.split(",")
    .map{|x|x.to_i}
    .inject(:+)
  end
end
