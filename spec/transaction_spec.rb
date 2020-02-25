# frozen_string_literal: true

require 'transaction'
require 'timecop'

describe Transaction do
  describe '#initialize' do
    it 'records a deposit' do
      Timecop.freeze
      transaction = described_class.new(10, nil, Time.now, 10)
      expect(transaction.credit).to eq 10
      expect(transaction.debit).to eq nil
      expect(transaction.date).to eq Time.now
      expect(transaction.balance).to eq 10
    end

    it 'records a withdrawal' do
      Timecop.freeze
      transaction = described_class.new(nil, 10, Time.now, 10)
      expect(transaction.credit).to eq nil
      expect(transaction.debit).to eq 10
      expect(transaction.date).to eq Time.now
      expect(transaction.balance).to eq 10
    end
  end
end
