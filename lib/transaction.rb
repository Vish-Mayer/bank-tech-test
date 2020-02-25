class Transaction
  attr_reader :credit, :debit, :balance, :date

  def initialize(credit, debit, date, balance)
    @credit = credit
    @debit = debit
    @date = date
    @balance = balance 
  end
end

