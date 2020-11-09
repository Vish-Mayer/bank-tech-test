# frozen_string_literal: true
require 'transaction'
require 'account'

describe Account do

  subject(:account) { described_class.new }

  describe '#initialize' do
    it 'initalizes a bank account with a default balance' do
      expect(account.balance).to eq Account::DEFAULT_BALANCE
    end
  end
end
