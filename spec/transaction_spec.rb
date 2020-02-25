require 'transaction'
require 'timecop'

describe Transaction do
  it 'records a deposit' do
    Timecop.freeze
    transaction = described_class.new(10, nil, 10, Time.now)
    expect(transaction.credit).to eq 10
    expect(transaction.debit).to eq nil
    expect(transaction.balance).to eq 10
    expect(transaction.date).to eq Time.now
  end

  it 'records a withdrawal' do
    Timecop.freeze
    transaction = described_class.new(nil, 10, 10, Time.now)
    expect(transaction.credit).to eq nil
    expect(transaction.debit).to eq 10
    expect(transaction.balance).to eq 10
    expect(transaction.date).to eq Time.now
  end
end