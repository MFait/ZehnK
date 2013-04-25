require './lib/score'
class Game
  attr_accessor :table_set, :pocket_set, :pocket_score, :banked_amount
  MIN_BANKABLE = 350

  def start
    @table_set = DiceSet.new
    6.times{ @table_set.add(Dice.new.roll) }

    @pocket_set = DiceSet.new
    @pocket_score = 0

    @banked_amount = 0

    self
  end

  def roll
    @table_set.roll
    self
  end

  def pocket(indices)
    taken_set = @table_set.take(indices)

    @pocket_set = @pocket_set + taken_set
    @pocket_score += Score.new.calculate(taken_set)

    self
  end

  def can_bank?
    @pocket_score >= MIN_BANKABLE
  end

  def bank
    @banked_amount += @pocket_score
    @pocket_score = 0

    self
  end

end