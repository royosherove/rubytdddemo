class LogStringFormatterBefore
  def format(text)
    machine = `hostname`.strip
    time = Time.now
    "#{time}- #{machine} #{text}"
  end
end

