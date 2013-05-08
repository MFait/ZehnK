module GameEngine
  class Player
    attr_accessor :pocket

    def initialize
      @pocket = Pocket.new
    end
  end
end
