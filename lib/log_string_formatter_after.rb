class LogStringFormatterAfter
  def self.format(text)
    time = Time.now
    "#{time} #{text}"
  end
end

