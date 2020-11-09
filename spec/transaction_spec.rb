require 'transaction'

describe Transaction do

  describe '#credit' do
    it 'credits the the amount according to the balance' do
      expect(subject.credit(0, 100)).to eq 100
    end
  end

  describe '#debit' do
    it 'debit the the amount according to the balance' do
      expect(subject.debit(100, 50)).to eq 50
    end
  end
end
