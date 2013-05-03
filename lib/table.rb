class Table
  attr_accessor :set

  def initialize
    @set = DiceSet.new
    6.times { @set.add(Dice.new.roll) }
  end

  def roll
    @set.roll
  end

  def take(args)
    @set.take(args)
  end

  def clone
    new_table = Table.new
    new_table.set = self.set.clone
    new_table
  end

end