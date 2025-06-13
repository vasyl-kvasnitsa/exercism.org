class Clock

  HID = HOURS_IN_DAY = 24
  MIH = MINUTES_IN_HOUR = 60
  DISPLAY = '%02i:%02i'.freeze

  private_constant :HID, :MIH

  private

  def initialize(hour: 0, minute: 0)
    @minutes = (minute + (hour % HID) * MIH) % (HID * MIH)
  end

  public

  attr_reader :minutes

  def to_s
    DISPLAY % minutes.divmod(MIH)
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