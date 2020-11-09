require 'transaction'
require 'account'

describe Account do

  subject(:account) { described_class.new }

  describe '#initialize' do
    it 'initalizes a bank account with a default balance' do
      expect(account.balance).to eq Account::DEFAULT_BALANCE
    end
  end

  describe '#deposit' do
    it 'increases the balance by the amount deposited' do
      account.deposit(10)
      expect(account.balance).to eq 10
    end
  end
end
