# frozen_string_literal: true

require 'date'

class TransactionRecord
  attr_reader :date, :credit, :debit, :balance

  def initialize(date: Date.today, credit: nil, debit: nil, balance: nil)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end
end
