require 'transaction'

describe Transaction do

  describe '#credit' do
    it 'credits the the amount according to the balance' do
      expect(subject.credit(0, 10)).to eq 10
    end
  end
end
