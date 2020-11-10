# frozen_string_literal: true

require 'transaction'
require 'record_transaction'

describe Transaction do
  
  let(:deposit_record) do
    double(:deposit_record,
           date: nil,
           credit: 200,
           debit: nil,
           balance: 300)
  end

  let(:withdraw_record) do
    double(:withdraw_record,
           date: nil,
           credit: nil,
           debit: 100,
           balance: 300)
  end

  subject { described_class.new }

  describe '#initalize' do
    it 'is initialized with an empty history array' do
      expect(subject.history).to be_empty
    end
  end

  describe '#credit' do
    it 'credits the the amount according to the balance' do
      subject.credit(100, 200)
      record = subject.history.first
      expect(record.credit).to eq deposit_record.credit
      expect(record.balance).to eq deposit_record.balance
    end
  end

  describe '#debit' do
    it 'credits the the amount according to the balance' do
      subject.debit(400, 100)
      record = subject.history.first
      expect(record.debit).to eq withdraw_record.debit
      expect(record.balance).to eq withdraw_record.balance
    end
  end

  describe '#add to history' do
    it 'adds a transaction record to the history array' do
      subject.add_to_history(deposit_record)
      subject.add_to_history(withdraw_record)
      expect(subject.history).to eq [deposit_record, withdraw_record]
    end
  end
end
