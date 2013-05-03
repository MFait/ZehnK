require './lib/score'
require './lib/table'

class Game
  attr_accessor :table, :bank, :last_action, :pocket
  MIN_BANKABLE = 350
  INVALID_SET_EXCEPTION = "Invalid Set"

  def start
   reset_sets
   @bank = Bank.new
    self
  end

  def roll
    reset_sets unless can_roll_again?

    if took_everything?
      @table = Table.new
      @pocket.reset_only_set
    end

    @table.roll
    @last_action = :roll

    self
  end


  def take(indices)
    raise(INVALID_SET_EXCEPTION) unless Score.new.can_calculate?(@table.clone.take(indices))

    @pocket.add(@table.take(indices))
    @last_action = :take

    self
  end

  def can_bank?
    @last_action == :take and @pocket.score >= MIN_BANKABLE
  end

  def deposit
    if can_bank?
      @bank.add(@pocket.score)
      reset_sets
    end

    self
  end

  private

  def reset_sets
    @table = Table.new
    @pocket = Pocket.new
  end

  def took_everything?
    @last_action == :take and @table.set.empty?
  end

  def can_roll_again?
    @last_action != :roll
  end

end
