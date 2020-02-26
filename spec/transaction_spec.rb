# frozen_string_literal: true

require 'transaction'

describe Transaction do
  describe '#initialize' do
    it 'records a deposit' do
      Timecop.freeze
      transaction = described_class.new(5, nil, 10, Time.now)
      expect(transaction.credit).to eq 5
      expect(transaction.debit).to eq nil
      expect(transaction.balance).to eq 10
      expect(transaction.date).to eq Time.now
    end

    it 'makes a deposit' do
      Timecop.freeze
      transaction = described_class.new(nil, 5, 10, Time.now)
      expect(transaction.credit).to eq nil
      expect(transaction.debit).to eq 5
      expect(transaction.balance).to eq 10
      expect(transaction.date).to eq Time.now
    end
  end
end
