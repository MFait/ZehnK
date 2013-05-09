module GameEngine
  class Player
    attr_accessor :pocket, :game, :bank, :last_action
    MIN_BANKABLE = 350

    def initialize
      @pocket = Pocket.new
      @bank = Bank.new
    end

    def can_bank?
      @last_action == :pick and @pocket.score >= MIN_BANKABLE
    end

    def deposit
      if can_bank?
        @bank.add(@pocket.score)
        @pocket = Pocket.new
        game.reset_table
      end

    end

    def play(action, args=nil)
      @pocket.add(game.pick(args)) if action == :pick
      game.roll if action == :roll
      deposit if action == :bank

      @last_action = action

      self
    end
  end
end
