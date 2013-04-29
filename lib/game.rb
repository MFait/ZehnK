require './lib/score'
class Game
  attr_accessor :table_set, :pocket_set, :pocket_score, :banked_amount, :roll_again
  MIN_BANKABLE = 350
  INVALID_SET_EXCEPTION = "Invalid Set"

  def start
   init_table_set
   init_pocket_set

   @banked_amount = 0
   @roll_again = true

    self
  end

  def roll
    unless @roll_again
      init_table_set
      init_pocket_set
    end

    @table_set.roll
    @roll_again = false
    self
  end

  def pocket(indices)
    would_be_taken = @table_set.clone.take(indices)
    raise(INVALID_SET_EXCEPTION) unless Score.new.can_calculate?(would_be_taken)

    taken_set = @table_set.take(indices)

    @pocket_set = @pocket_set + taken_set
    @pocket_score += Score.new.calculate(taken_set)

    @roll_again = true
    self
  end

  def can_bank?
    @pocket_score >= MIN_BANKABLE
  end

  def bank
    @banked_amount += @pocket_score
    init_table_set()

    init_pocket_set()

    self
  end

  private

  def init_pocket_set
    @pocket_set = DiceSet.new
    @pocket_score = 0
  end

  def init_table_set
    @table_set = DiceSet.new
    6.times { @table_set.add(Dice.new.roll) }
  end

end