class Transaction
  attr_reader :credit, :debit, :balance, :date

  def initialize(credit, debit, balance, date)
    @credit = credit
    @debit = debit
    @balance = balance
    @date = date
  end
end