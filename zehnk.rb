require 'sinatra'
require './lib/dice'
require 'haml'

get '/' do
  dice = Dice.new
  dice.roll
  haml :index, :locals => { :dice => dice}
end