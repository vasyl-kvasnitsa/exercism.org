class Clock
  HID = HOURS_IN_DAY = 24
  MIH = MINUTES_IN_HOUR = 60

  private_constant :HID, :MIH

  private

  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  def formated(time)
    time <= 9 ? "0#{time}" : time
  end

  public

  attr_reader :hour, :minute

  def to_s
    hours_from_minutes, total_minutes = minute.divmod(MIH)
    total_hours = (hour + hours_from_minutes) % HID
    
    [formated(total_hours), formated(total_minutes)].join(':')
  end

  ['+', '-'].each do |action|
    define_method(action) do |other_clock|
      Clock.new(hour: self.hour.send(action, other_clock.hour),
                minute: self.minute.send(action, other_clock.minute))
           .to_s
    end
  end

  def ==(other_clock)
    self.to_s == other_clock.to_s
  end
end