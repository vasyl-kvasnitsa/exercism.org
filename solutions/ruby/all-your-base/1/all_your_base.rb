class BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if invalid_base?(input_base) || invalid_base?(output_base)
    raise ArgumentError if invalid_digits?(digits, input_base)
    
    in_10_base = new(input_base, digits, output_base).convert_into_10_base
    return in_10_base.digits.reverse if output_base == 10

    new(10, in_10_base, output_base).convert_into_given_base
  end

  def self.invalid_base?(base)
    base <= 1
  end

  def self.invalid_digits?(digits, base)
    digits.any? { |d| !(0...base).include?(d) }
  end

  public

  def convert_into_10_base
    @digits.reverse
           .each_with_index
           .reduce(0) { |sum, (digit, index)| sum + (digit * @input_base**index) }
  end

  def convert_into_given_base
    result = []

    while @digits >= @output_base do
      result << @digits % @output_base

      @digits = @digits / @output_base
    end

    result << @digits == @output_base ? 0 : @digits
    result.reverse
  end

  private

  def initialize(input_base, digits, output_base)
    @input_base = input_base
    @digits = digits
    @output_base = output_base
  end
end