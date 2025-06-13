module BaseConverter
  def self.convert(in_base, digits, out_base)
    number = Number.new(digits, in_base)

    number.in_10_base

    number.base == out_base ? number.digits : number.convert_into!(out_base)
  end

  class Number
  attr_accessor :digits, :base

  def in_10_base
    self.digits = digits.reverse
                        .each_with_index
                        .reduce(0) { |sum, (digit, index)| sum + (digit * base**index) }
                        .digits
                        .reverse
    self.base = 10
  end

  def convert_into!(given_base)
    raise ArgumentError if given_base <= 1

    result = []
    number_in_10_base = digits.join.to_i

    while number_in_10_base >= given_base do
      result << number_in_10_base % given_base

      number_in_10_base = number_in_10_base / given_base
    end

    result << number_in_10_base == given_base ? 0 : number_in_10_base
    result.reverse
  end

  private

  def initialize(digits, base)
    raise ArgumentError if base <= 1 || digits.any? { |d| !(0...base).include?(d) }
    
    @digits = digits
    @base = base
  end
end
end
