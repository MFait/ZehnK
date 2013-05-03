class Bank
  attr_accessor :amount

  def initialize
    @amount = 0
  end

  def add(amount)
    @amount += amount
    self
  end
end