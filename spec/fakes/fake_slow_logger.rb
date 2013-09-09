class FakeSlowLogger
  attr_accessor :numbers
  def write(numbers)
    @numbers = numbers
  end
end
