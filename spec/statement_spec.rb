# frozen_string_literal: true

require 'statement'
require 'transaction'

describe Statement do
  subject { described_class.new }
  let(:deposit_transaction) { Transaction.new(100, nil, 100.00, Time.now) }
  let(:withdraw_transaction) { Transaction.new(nil, 100, 100.00, Time.now) }
  let(:statement) { [deposit_transaction, withdraw_transaction] }

  it 'prints out statement based on an array' do
    printed_statement = "date || credit || debit || balance\n#{Time.now.strftime('%d/%m/%Y')} || || £100.00 || £100.00\n#{Time.now.strftime('%d/%m/%Y')} || £100.00 || || £100.00\n"
    expect { subject.print(statement) }.to output(printed_statement).to_stdout
  end
end
