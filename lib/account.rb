require_relative 'transaction'
require_relative 'statement'

class Account

  attr_reader :balance, :transaction, :statement
  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE, transaction = Transaction.new, statement = Statement.new)
    @balance = balance
    @transaction = transaction
    @statement = statement
  end 

  def deposit(amount)
    transaction.credit(balance, amount)
    @balance += amount 
  end

  def withdraw(amount)
    transaction.debit(balance, amount)
    @balance -= amount
  end 

  def print_statement
    statement.print(transaction.history)
  end 
end
