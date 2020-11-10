# frozen_string_literal: true

require 'date'

class TransactionRecord
  attr_reader :type, :date, :credit, :debit, :balance

  def initialize(type: nil, date: Date.today, credit: nil, debit: nil, balance: nil)
    @type = type 
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end
end
