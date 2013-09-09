class LogStringFormatterBefore
  def format(text)
    time = Time.now
    "#{time} #{text}"
  end
end

