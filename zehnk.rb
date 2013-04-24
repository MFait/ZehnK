require 'sinatra'
require './lib/dice'
require './lib/dice_set'
require './lib/game'
require 'haml'
require 'sinatra/session'
require './helpers/view_helpers'

set :session_secret, 'So0perSeKr3t!'


get '/' do
  game = game_session
  #game.start
  #game.pocket([1,2])
  haml :index, :locals => { :game => game}
end

def game_session
  session_start! unless session?
  session["game"] = Game.new.start unless session["game"]

  session["game"]
end