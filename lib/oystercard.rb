class Oystercard

  MAXIMUM_BALANCE = 50

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up amount
    fail "Maximum balance is £50" if balance + amount > MAXIMUM_BALANCE
    @balance = amount + balance
  end
end
