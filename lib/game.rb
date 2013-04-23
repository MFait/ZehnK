class Game
  attr_accessor :table_set, :pocket_set

  def start
    @table_set = DiceSet.new
    @pocket_set = DiceSet.new
    6.times{ @table_set.add(Dice.new.roll) }
    self
  end

  def roll
    @table_set.roll
    self
  end

  def pocket(indices)
    @pocket_set = @pocket_set + @table_set.take(indices)
    self
  end
end