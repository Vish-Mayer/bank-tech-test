# frozen_string_literal: true
require 'transaction'
require 'account'

describe Account do

  describe '#initialize' do
    it 'initalizes a bank account with a default balance' do
      expect(subject.balance).to eq 0
    end
  end

end
