class BankAccount

  CANNOT_CLOSE_MESSAGE = "You can't close an already closed account"
  CANNOT_OPEN_MESSAGE = "You can't open an already open account"
  CANNOT_WITHDRAW_MESSAGE = "You can't withdraw more than you have"
  CANNOT_WITHDRAW_NEGATIVE_MESSAGE = "You can't withdraw a negative amount"
  CANNOT_DEPOSIT_MESSAGE = "You can't deposit money into a closed account"
  CANNOT_DEPOSIT_NEGATIVE_MESSAGE = "You can't deposit a negative amount"

  def open
    raise ArgumentError, CANNOT_OPEN_MESSAGE unless @is_closed
    
    @is_closed = false
  end

  def close
    raise ArgumentError, CANNOT_CLOSE_MESSAGE if @is_closed

    @balance = 0
    @is_closed = true
  end

  def balance
    raise ArgumentError if @is_closed

    @balance
  end

  def deposit(amount)
    raise ArgumentError, CANNOT_DEPOSIT_MESSAGE if @is_closed
    raise ArgumentError, CANNOT_DEPOSIT_NEGATIVE_MESSAGE if amount.negative?

    @balance += amount
  end

  def withdraw(amount)
    raise ArgumentError if @is_closed
    raise ArgumentError, CANNOT_WITHDRAW_MESSAGE if @balance < amount
    raise ArgumentError, CANNOT_WITHDRAW_NEGATIVE_MESSAGE if amount.negative?
    
    @balance -= amount
  end

  private

  def initialize
    @balance = 0
    @is_closed = true
  end

end