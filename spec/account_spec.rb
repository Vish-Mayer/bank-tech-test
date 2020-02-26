# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:statement_printer) { Statement.new }

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
      expect { account.deposit(-10.00) }.to raise_error 'You can not deposit a negative amount'
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

  describe '#print_statement' do
    it 'prints out bank statement' do
      account.deposit(2000, '01/01/2010')
      account.withdraw(1000, '01/01/2010')
      statement = "date || credit || debit || balance\n01/01/2010 || || £1000.00 || £1000.00\n01/01/2010 || £2000.00 || || £2000.00\n"
      expect { account.print_statement(statement_printer) }.to output(statement).to_stdout
    end
  end
end
