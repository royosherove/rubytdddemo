class StringCalculator
  attr_accessor :last_sum

  def initialize(thelogger,thewebservice)
    @last_sum = 0
    @logger = thelogger
    @ws = thewebservice
  end

  def add(numbers)
    raise "only positives please!" if numbers.include?("-")
    @last_sum = calculate(numbers)
    notify_logger(@last_sum)
    @last_sum
  end

  def notify_logger(sum)
    begin
    @logger.write("got #{sum}")
    rescue Exception => e
      @ws.notify("got '#{e.message}'")
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
