class Clock
  HID = HOURS_IN_DAY = 24
  MIH = MINUTES_IN_HOUR = 60
  DISPLAY_LENGTH = 2

  private_constant :HID, :MIH

  private

  def initialize(hour: 0, minute: 0)
    @total_minutes = (minute + hour * MIH) % (HID*MIH)
  end

  def display(time)
    return time if time.to_s.size == DISPLAY_LENGTH

    display('0' << time.to_s)
  end

  public

  attr_reader :total_minutes

  def to_s
    hours, minutes = total_minutes.divmod(MIH)

    [hours % HID, minutes].map { |time| display(time) }.join(':')
  end

  def +(other_clock)
    Clock.new(minute: self.total_minutes + other_clock.total_minutes)
  end

  def -(other_clock)
    Clock.new(minute: self.total_minutes - other_clock.total_minutes)
  end

  def ==(other_clock)
    [self, other_clock].map { |clock| clock.total_minutes }.uniq.count == 1
  end
end