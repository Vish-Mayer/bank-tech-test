# frozen_string_literal: true

require 'time'
require_relative 'transaction'

class Account
  attr_reader :balance, :statement, :date
  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
    @statement = []
  end

  def deposit(amount, date = Time.now.to_s)
    deposit_error if amount < @balance
    @balance += amount
    new_transaction(Time.parse(date), amount, nil)
    end

  def withdraw(amount, date = Time.now.to_s)
    withdraw_error if amount > @balance
    @balance -= amount
    new_transaction(Time.parse(date), amount, nil)
    end

  def withdraw_error
    raise 'Insufficent funds'
  end

  def deposit_error
    raise 'You can not deposit a negative amount'
  end

  private

  def new_transaction(date, credit = nil, debit = nil)
    transaction = Transaction.new(credit, debit, date, @available_balance)
    @statement << transaction
  end
end
