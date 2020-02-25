require 'account'

describe Account do

  subject(:account) {described_class.new}

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
      expect{account.deposit(-10.00)}.to raise_error 'You can not deposit a negative amount'
    end 
  end

  describe '#withdraw' do
    it 'decreases the balance by the withdraw amount' do
      account.deposit(10.00)
      account.withdraw(5.00)
      expect(account.balance).to eq 5.00
    end
  end 
end