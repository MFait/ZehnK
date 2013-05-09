class Bank
  attr_accessor :amount

  def initialize
    @amount = 0
  end

  def add(amount)
    @amount += amount
    self
  end

  def ==(other)
    @amount == other.amount
  end

end