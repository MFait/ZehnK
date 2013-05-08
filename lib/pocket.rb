class Pocket

  attr_accessor :score, :set

  def initialize
    @score = 0
    @set = DiceSet.new
  end

  def reset_only_set
    @set = DiceSet.new
  end

  def add(set)
    @set = @set + set
    @score += Score.new.calculate(set)
  end

  def ==(other)
    @set == other.set and @score == other.score
  end

end