# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe '#initialize' do
    it 'an account is opened with a default balance of 0' do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'increases the balance by the amount deposited' do
      account.deposit(10.00)
      expect(account.balance).to eq 10.00
    end

    it 'raises an error if deposit amount is negative' do
      message = 'You can not deposit a negative amount'
      expect { account.deposit(-10.00) }.to raise_error message
    end
  end

  describe '#withdraw' do
    it 'decreases the balance by the withdraw amount' do
      account.deposit(10.00)
      account.withdraw(5.00)
      expect(account.balance).to eq 5.00
    end

    it 'raises an error if withdraw amount > balance' do
      expect { account.withdraw(1.00) }.to raise_error 'Insufficent funds'
    end
  end
end
