# aa

class BankAccount
  attr_reader :owner, :balance

  def initialize(owner, balance = 0)
    @owner = owner
    @balance = balance
  end

  def deposit(deposit)
    raise ArgumentError, 'cant be 0 or below 0' if deposit == 0 || deposit < 0

    @balance = balance + deposit
  end

  def withdraw(sum)
    raise ArgumentError, 'cant withdraw not enough funds' if sum > balance
    raise ArgumentError, 'cant withdraw a negative sum' if sum <= 0

    @balance = balance - sum
  end

  def to_s
    "#{@owner}: #{@balance}"
  end

  def transfer_to(account, sum)
    raise ArgumentError, 'account not found' if account.nil? == true
    raise ArgumentError, 'not enough money to transfer' if sum > balance
    raise ArgumentError, 'not enough money to transfer' if sum <= 0

    withdraw(sum)
    account.deposit(sum)
  end
end

a = BankAccount.new('domantas', 300)
puts a
b = BankAccount.new('dziugas', 400)
puts b
puts a.transfer_to(b, 100)
puts a
puts b
