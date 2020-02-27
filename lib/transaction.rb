# frozen_string_literal: true

# Class for recording a transaction
class Transaction
  attr_reader :credit, :debit, :balance, :date

  def initialize(credit, debit, balance, date)
    @credit = credit
    @debit = debit
    @balance = balance
    @date = date
  end

  def hi
    "hello there"
  end
end 
