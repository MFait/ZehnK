require 'sinatra'
require './lib/dice'

get '/' do
  dice = Dice.new
  dice.roll
  erb :index, :locals => { :dice => dice}
end