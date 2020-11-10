# frozen_string_literal: true

require 'record_transaction'

describe TransactionRecord do
  let(:deposit_record) { double(date: '01/01/2000', credit: 100, debit: nil, balance: 200) }
  let(:withdraw_record) { double(date: '01/01/2000', credit: nil, debit: 300, balance: 100) }

  describe '#initialize' do
    it 'allows for a deposit transaction to be recorded' do
      expect(deposit_record.date).to eq('01/01/2000')
      expect(deposit_record.credit).to eq(100)
      expect(deposit_record.debit).to be_nil
      expect(deposit_record.balance).to eq(200)
    end
    it 'allows for a withdraw transaction to be recorded' do
      expect(withdraw_record.date).to eq('01/01/2000')
      expect(withdraw_record.credit).to be_nil
      expect(withdraw_record.debit).to eq(300)
      expect(withdraw_record.balance).to eq(100)
    end
  end
end
