# frozen_string_literal: true

require_relative 'record_transaction'

class Transaction
  attr_reader :history, :transaction_record

  def initialize(transaction_record = TransactionRecord)
    @transaction_record = transaction_record
    @history = []
  end

  def credit(balance, amount)
    update_balance = balance + amount
    add_to_history(@transaction_record.new(balance: update_balance, credit: amount))
  end

  def debit(balance, amount)
    update_balance = balance - amount
    @history << @transaction_record.new(balance: update_balance, debit: amount)
  end

  def add_to_history(transaction)
    @history << transaction
  end
end
