require 'sinatra'
require './lib/dice'
require './lib/dice_set'
require './lib/game'
require 'haml'

helpers do
  def display_dice_set(dice_set)
    output = []
    dice_set.dices.each do |dice|
       output << display_dice(dice)
    end
    output.join ''
  end

  def display_dice(dice)
    "<img src='images/dice_#{dice.face}.png'/>"
  end
end

get '/' do
  game  = Game.new
  game.start
  haml :index, :locals => { :game => game}
end