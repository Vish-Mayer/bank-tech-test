class Transaction

  def credit(balance, amount)
    balance + amount
  end

  def debit(balance, amount)
    balance - amount 
  end 
end
