class Clock
  attr_reader :hour, :minute
  def initialize(hour: 0 ,minute: 0)
    @minute = minute % 60
    @hour = (hour + (minute / 60)) % 24
  end

  def to_s()
    sprintf("%.2d:%.2d", @hour, @minute)
  end

  def +(clock)
    Clock.new(hour: @hour + clock.hour, minute: @minute + clock.minute)
  end

  def -(clock)
    Clock.new(hour: @hour - clock.hour, minute: @minute - clock.minute)
  end

  def ==(clock)
    return @hour == clock.hour && @minute == clock.minute
  end
end
