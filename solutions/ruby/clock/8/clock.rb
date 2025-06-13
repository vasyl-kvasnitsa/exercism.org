class Clock

  HID = HOURS_IN_DAY = 24
  MIH = MINUTES_IN_HOUR = 60
  DISPLAY = '%<hour>02i:%<minute>02i'

  private_constant :HID, :MIH

  private

  def initialize(hour: 0, minute: 0, display: DISPLAY)
    @minutes = (minute + (hour % HID) * MIH) % (HID * MIH)
    @display = display
  end

  public

  attr_reader :minutes, :display

  def to_s
    hour, minute = minutes.divmod(MIH)
    
    display % { hour: hour, minute: minute }
  end

  def +(other_clock)
    Clock.new(minute: minutes + other_clock.minutes)
  end

  def -(other_clock)
    Clock.new(minute: minutes - other_clock.minutes)
  end

  def ==(other_clock)
    minutes == other_clock.minutes
  end

  def adjust_up
    minutes += 1
  end

  def adjust_down
    minutes -= 1
  end

end

if $PROGRAM_NAME == __FILE__
  puts Clock.new(hour: 0, minute: 10)
  puts Clock.new(hour: 0, minute: 10, display: 'The time now is %02i.%02i.')
end