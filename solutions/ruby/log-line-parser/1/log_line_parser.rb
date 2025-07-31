class LogLineParser
    
  def initialize(line)
    @line = line
  end

  def message
    @line.strip.gsub(/\[.*\]:\s+/, "")
  end

  def log_level
    @line.match(/.*\[(.*)\].*/)[1].downcase
  end

  def reformat
    match = @line.strip.match(/.*\[(.*)\]:\s+(.*)/)
    "#{match[2]} (#{match[1].downcase})"
  end
end
