class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    begin
      raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)
      raise ArgumentError if [first_operand, second_operand].any? { |a| !a.is_a?(Integer)}
      raise ZeroDivisionError if second_operand.zero?

      result = first_operand.send(operation, second_operand)
      [first_operand, operation, second_operand, '=', result].join(' ')
    rescue ZeroDivisionError => e
      'Division by zero is not allowed.'
    end
  end

  class UnsupportedOperation < StandardError
  end
end
