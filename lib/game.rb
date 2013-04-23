class Game
  attr_reader :table_set, :pocket_set

  def start
    @table_set = DiceSet.new
    @pocket_set = DiceSet.new
    6.times{ @table_set.add(Dice.new.roll) }
    self
  end


end