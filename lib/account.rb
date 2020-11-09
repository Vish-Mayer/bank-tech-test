require_relative 'transaction'

class Account

  attr_reader :balance, :transaction
  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE, transaction = Transaction.new)
    @balance = balance
    @transaction = transaction
  end 

  def deposit(amount)
    transaction.credit(balance, amount)
    @balance += amount 
  end

  def withdraw(amount)
    transaction.debit(balance, amount)
    @balance -= amount
  end 
end
