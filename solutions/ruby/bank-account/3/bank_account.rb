class NegativeDepositError < ArgumentError

  private

  def initialize(message = "You can't deposit a negative amount")
    super
  end

end

class NegativeWithdrawError < ArgumentError

  private

  def initialize(message = "You can't withdraw a negative amount")
    super
  end

end

class DepositToClosedAccountError < ArgumentError

  private

  def initialize(message = "You can't deposit money into a closed account")
    super
  end

end

class AlreadyClosedAccountError < ArgumentError

  private

  def initialize(message = "You can't close an already closed account")
    super
  end

end

class AlreadyOpenAccountError < ArgumentError

  private

  def initialize(message = "You can't open an already open account")
    super
  end

end

class WithdrawAmountBiggerThanBalanceError < ArgumentError

  private

  def initialize(message = "You can't withdraw more than you have")
    super
  end

end
  
class BankAccount

  def open
    raise AlreadyClosedAccountError unless @is_closed
    
    @is_closed = false
  end

  def close
    raise AlreadyClosedAccountError if @is_closed

    @balance = 0
    @is_closed = true
  end

  def balance
    raise ArgumentError if @is_closed

    @balance
  end

  def deposit(amount)
    raise DepositToClosedAccountError if @is_closed
    raise NegativeDepositError if amount.negative?

    @balance += amount
  end

  def withdraw(amount)
    raise ArgumentError if @is_closed
    raise WithdrawAmountBiggerThanBalanceError if @balance < amount
    raise NegativeWithdrawError if amount.negative?
    
    @balance -= amount
  end

  private

  def initialize
    @balance = 0
    @is_closed = true
  end

end