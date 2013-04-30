require './lib/score'
class Game
  attr_accessor :table_set, :pocket_set, :pocket_score, :banked_amount, :last_action
  MIN_BANKABLE = 350
  INVALID_SET_EXCEPTION = "Invalid Set"

  def start
   reset_sets
   @banked_amount = 0

    self
  end

  def roll
    reset_sets unless can_roll_again?
    if pocketed_everything?
      init_table_set
      @pocket_set = DiceSet.new
    end

    @table_set.roll
    @last_action = :roll

    self
  end


  def pocket(indices)
    would_be_taken = @table_set.clone.take(indices)
    raise(INVALID_SET_EXCEPTION) unless Score.new.can_calculate?(would_be_taken)

    taken_set = @table_set.take(indices)

    @pocket_set = @pocket_set + taken_set
    @pocket_score += Score.new.calculate(taken_set)

    @last_action = :pocket
    self
  end

  def can_bank?
    @last_action == :pocket and @pocket_score >= MIN_BANKABLE
  end

  def bank
    if can_bank?
      @banked_amount += @pocket_score

      reset_sets
    end

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

  def reset_sets
    init_table_set
    init_pocket_set
  end

  def pocketed_everything?
    @last_action == :pocket and @table_set.empty?
  end

  def can_roll_again?
    @last_action != :roll
  end

end
