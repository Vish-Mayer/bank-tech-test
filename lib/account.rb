require_relative 'transaction'

class Account

  attr_reader :balance, :transaction
  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE, transaction = Transaction.new)
    @balance = balance
    @transaction = transaction
  end 

  def deposit(amount)
    @balance += (transaction.credit(@balance, amount))
  end
end
