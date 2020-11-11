# frozen_string_literal: true

require 'transaction'
require 'record_transaction'

describe Transaction do
  subject(:transaction) { described_class.new }

  let(:deposit_record) do
    double(date: Date.today,
           credit: 200,
           debit: nil,
           balance: 300)
  end

  let(:withdraw_record) do
    double(date: Date.today,
           credit: nil,
           debit: 100,
           balance: 300)
  end

  describe '#initalize' do
    it 'is initialized with an empty history array' do
      expect(transaction.history).to be_empty
    end
  end

  describe '#credit' do
    it 'adds a credit transaction to a new record' do
      transaction.credit(100, 200)
      record = transaction.history.first
      expect(record.date).to eq deposit_record.date
      expect(record.credit).to eq deposit_record.credit
      expect(record.debit).to eq deposit_record.debit
      expect(record.balance).to eq deposit_record.balance
    end
  end

  describe '#debit' do
    it 'adds a debit transaction to a new record' do
      transaction.debit(400, 100)
      record = transaction.history.first
      expect(record.date).to eq withdraw_record.date
      expect(record.credit).to eq withdraw_record.credit
      expect(record.debit).to eq withdraw_record.debit
      expect(record.balance).to eq withdraw_record.balance
    end
  end

  describe '#add to history' do
    it 'adds a record to the history array' do
      transaction.add_to_history(deposit_record)
      transaction.add_to_history(withdraw_record)
      expect(transaction.history).to eq [deposit_record, withdraw_record]
    end
  end
end
