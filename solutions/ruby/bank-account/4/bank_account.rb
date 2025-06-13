class DepositError < ArgumentError

  private

  def initialize(message = "You can't deposit money into a closed account")
    super
  end

end

class ClosedAccountError < ArgumentError

  private

  def initialize(message = "You can't close an already closed account")
    super
  end

end

class OpenAccountError < ArgumentError

  private

  def initialize(message = "You can't open an already open account")
    super
  end

end

class WithdrawalError < ArgumentError

  private

  def initialize(message = "You can't withdraw more than you have")
    super
  end

end

class BankAccount

  def open
    raise OpenAccountError unless @closed

    @closed = false
  end

  def close
    raise ClosedAccountError if @closed

    @balance = 0
    @closed = true
  end

  def deposit(amount)
    raise DepositError if @closed
    raise DepositError, "You can't deposit a negative amount" if amount.negative?

    @balance += amount
  end

  def withdraw(amount)
    raise ArgumentError if @closed
    raise WithdrawalError if @balance < amount
    raise WithdrawalError, "You can't withdraw a negative amount" if amount.negative?

    @balance -= amount
  end

  def balance
    raise ClosedAccountError if @closed

    @balance
  end

  private

  def initialize
    @balance = 0
    @closed = true
  end

end