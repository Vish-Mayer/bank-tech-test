# frozen_string_literal: true

# Class for printing a statement
# class Statement

#   def initialize
#     @header = 'date || credit || debit || balance'
#   end

#   def format(history)
#     transactions = history.reverse.map do |transaction|
#       print(transaction)
#     end
#     @header + "\n" + transactions.join("\n")
#   end

#   def print(transaction)
#     # transaction.credit
#     # transaction.debit
#     # transaction.balance

#     "#{transaction.date.strftime('%d/%m/%Y')} || #{transaction.credit} || " \
#     "#{transaction.debit} || #{transaction.balance}"
#   end 
# end

class Statement
  def print(statement)
    puts 'date || credit || debit || balance'
    output(statement)
  end

  private

  def output(statement)
    statement.reverse.each do |transaction|
      if transaction.credit.nil?
        puts "#{date_format(transaction.date)} || || #{format('£%0.2f', transaction.debit)} || #{format('£%0.2f', transaction.balance)}"
      else
        puts "#{date_format(transaction.date)} || #{format('£%0.2f', transaction.credit)} || || #{format('£%0.2f', transaction.balance)}"
      end
    end
  end

  def date_format(date)
    date.strftime('%d/%m/%Y')
  end
end
