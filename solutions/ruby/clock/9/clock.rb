class Clock

  HID = HOURS_IN_DAY = 24
  MIH = MINUTES_IN_HOUR = 60
  DISPLAY = '%<hour>02i:%<minute>02i'

  private_constant :HID, :MIH

  private

  def initialize(hour: 0, minute: 0, display: DISPLAY)
    @minutes = convert_into_minutes(hour, minute)
    @display = display
  end

  def convert_into_minutes(hour, minute)
    (minute + (hour % HID) * MIH) % (HID * MIH)
  end

  public

  attr_reader :minutes, :display

  def to_s
    hour, minute = minutes.divmod(MIH)

    display % { hour: hour, minute: minute }
  end

  def +(other_clock)
    @minutes = convert_into_minutes(0, minutes + other_clock.minutes)

    self
  end

  def -(other_clock)
    @minutes = convert_into_minutes(0, minutes - other_clock.minutes)

    self
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