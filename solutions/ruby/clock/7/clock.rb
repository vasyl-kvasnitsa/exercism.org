class Clock

  HID = HOURS_IN_DAY = 24
  MIH = MINUTES_IN_HOUR = 60
  DISPLAY = '%02i:%02i'

  private_constant :HID, :MIH

  private

  def initialize(hour: 0, minute: 0, display: DISPLAY)
    @minutes = (minute + (hour % HID) * MIH) % (HID * MIH)
    @display = display
  end

  public

  attr_reader :minutes, :display

  def to_s
    display % minutes.divmod(MIH)
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

end