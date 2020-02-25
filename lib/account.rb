class Account

  attr_reader :balance
  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def deposit(amount)
    if amount.negative?
      raise 'You can not deposit a negative amount'
    else 
      @balance += amount 
    end 
  end 
end 