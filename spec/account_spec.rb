require 'transaction'
require 'account'
require 'statement'

describe Account do

  subject(:account) { described_class.new }
  let(:statement) { double(:statement) }
  let(:transaction) { double(history: history) }
  let(:history) { ['record1', 'record2'] }
  
  describe '#initialize' do
    it 'initalizes a bank account with a default balance' do
      expect(account.balance).to eq Account::DEFAULT_BALANCE
    end
    it 'is initialized with a an instance of the Transaction class' do
      expect(account.transaction).to be_an_instance_of(Transaction)
    end
    it 'is initialized with a an instance of the Statement class' do
      expect(account.statement).to be_an_instance_of(Statement)
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

  describe '#print_statement' do
    it 'prints out bank statement' do
      subject = Account.new(0, transaction, statement)
      allow(statement).to receive(:print).and_return('returned output')
      expect(subject.print_statement).to eq('returned output')
    end
  end
end
