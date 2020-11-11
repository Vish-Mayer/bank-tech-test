require 'statement'

describe Statement do
  subject { described_class.new }
  let(:deposit_double) { double(date: Date.today, credit: 100, debit: nil, balance: 100) }
  let(:withdraw_double) { double(date: Date.today, credit: nil, debit: 100, balance: 100) }
  let(:mock_history) { [deposit_double, withdraw_double] }

  it 'prints out statement based on an array' do
    printed_statement = "date || credit || debit || balance\n#{Time.now.strftime('%d/%m/%Y')} || || £100.00 || £100.00\n#{Time.now.strftime('%d/%m/%Y')} || £100.00 || || £100.00\n"
    expect { subject.print(mock_history) }.to output(printed_statement).to_stdout
  end
end
