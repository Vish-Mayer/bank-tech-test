# frozen_string_literal: true

require 'time'
require_relative 'statement'
require_relative 'transaction'

# Class for bank account
class Account
  attr_reader :balance, :date, :statement
  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
    @statement = []
  end

  def deposit(amount, date = Time.now.to_s)
    deposit_error if amount.negative?
    @balance += amount
    create_transaction(Time.parse(date), amount, nil)
    format("You've deposited "'£%.2f', amount.to_s)
  end

  def withdraw(amount, date = Time.now.to_s)
    withdraw_error if amount > @balance
    @balance -= amount
    create_transaction(Time.parse(date), nil, amount)
    format("You've withdrawn "'£%.2f', amount.to_s)
  end

  def print_statement(printer = Statement.new)
    printer.print(@statement)
  end

  def withdraw_error
    raise 'Insufficent funds'
  end

  def deposit_error
    raise 'You can not deposit a negative amount'
  end

  private

  def create_transaction(date, credit = nil, debit = nil)
    transaction = Transaction.new(credit, debit, @balance, date)
    @statement << transaction
  end
end
