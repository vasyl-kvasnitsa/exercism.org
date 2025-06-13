class Clock
  HID = HOURS_IN_DAY = 24
  MIH = MINUTES_IN_HOUR = 60
  DISPLAY_LENGTH = 2

  private_constant :HID, :MIH

  private

  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  def display(time)
    return time if time.to_s.size == DISPLAY_LENGTH

    display('0' << time.to_s)
  end

  public

  attr_reader :hour, :minute

  def to_s
    hours_from_minutes, total_minutes = minute.divmod(MIH)
    total_hours = (hour + hours_from_minutes) % HID

    [display(total_hours), display(total_minutes)].join(':')
  end

  def +(other_clock)
    Clock.new(hour: self.hour + other_clock.hour, minute: self.minute + other_clock.minute).to_s
  end

  def -(other_clock)
    Clock.new(hour: self.hour - other_clock.hour, minute: self.minute - other_clock.minute).to_s
  end

  def ==(other_clock)
    self.to_s == other_clock.to_s
  end
end