require 'transaction'
require 'account'

describe Account do

  subject(:account) { described_class.new }
  
  describe '#initialize' do
    it 'initalizes a bank account with a default balance' do
      expect(account.balance).to eq Account::DEFAULT_BALANCE
    end
    it 'is initialized with a an instance of the Transaction class' do
      expect(account.transaction).to be_an_instance_of(Transaction)
    end
  end

  describe 'class methods' do

    before (:each) do 
      account.deposit(100)
    end 

    describe '#deposit' do
      it 'increases the balance by the amount deposited' do
        expect(account.balance).to eq 100
      end
    end

    describe '#withdraw' do
      it 'decreases the balance by the amount withdrawn' do
        account.withdraw(50)
        expect(account.balance).to eq 50
      end
    end
  end
end
