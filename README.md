# Specification
## Requirements

You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal. Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

## User Stories

 Using the required specifications, I devised a set of user stories to break down the tasks into smaller steps.

    As a client
    So that I have my money in one place
    I would like to open a bank account.

    As a client
    So I can save my money
    I would like to make deposits into my account.

    As a client
    So I can spend my money
    I would like to make witrhdrawals from my account.

    As a client
    So I can keep track of my spending 
    I would like to print my bank statement and view my transactions.

## Approach
    
The key concepts that I attempted to adhere to were:

* Object-oriented design
* Test-driven development
* Concise methods
* Seperation of concerns

## Installation
#### Clone this repo onto your local machine
    https://github.com/Vish-Mayer/bank-tech-test.git
#### Run bundle install in the root file
    bundle install
#### Run tests
    rspec

## How to use
    2.6.3 :001 > require './lib/account.rb'
    => true 
    2.6.3 :002 > demo = Account.new
    => #<Account:0x00007ff0c207bb50 @balance=0, @statement=[]> 
    2.6.3 :003 > demo.deposit(200)
    => "You've deposited £200.00" 
    2.6.3 :004 > demo.withdraw(50)
    => "You've withdrawn £50.00" 
    2.6.3 :005 > demo.print_statement
    date || credit || debit || balance
    26/02/2020 || || £50.00 || £150.00
    26/02/2020 || £200.00 || || £200.00
    




