class Account

  attr_reader :balance
  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def deposit(amount)
    if amount.negative?
      deposit_error 
    else 
      @balance += amount 
    end 
  end

  def withdraw(amount)
    if amount > @balance
      withdraw_error
    else
      @balance -= amount
    end 
  end

  private

  def withdraw_error
    raise 'Insufficent funds'
  end 

  def deposit_error
    raise 'You can not deposit a negative amount'
  end 
end 