class BaseConverter
  def self.convert(in_base, digits, out_base)
    raise ArgumentError if in_base <= 1 || out_base <= 1 || digits.any? { |d| !(0...in_base).include?(d) }

    
    in_10_base = new(in_base, digits, out_base).convert_into_10_base
    return in_10_base.digits.reverse if out_base == 10

    new(10, in_10_base, out_base).convert_into_given_base
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