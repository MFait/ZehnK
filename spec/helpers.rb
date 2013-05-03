require 'rspec'

Dir["./lib/*.rb"].each { |file| require file }

module Helpers

  def dice_set_with(faces)
    dice_set = DiceSet.new
    faces.each do |face|
      dice = Dice.new
      dice.face = face
      dice_set.add(dice)
    end
    dice_set
  end

  def start_game_with(dice_faces)
    game = Game.new.start
    game.table.set = dice_set_with(dice_faces)

    game
  end

end

RSpec.configure do |c|
  c.include Helpers
end


