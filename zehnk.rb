require 'sinatra'
require './lib/dice'
require './lib/dice_set'
require './lib/game'
require 'haml'
require 'sinatra/session'
require './helpers/view_helpers'

set :session_secret, 'So0perSeKr3t!'


get '/' do
  haml :index, :locals => { :game => current_game}
end

get '/reset' do
  session.clear if session?
  redirect '/'
end

get '/take' do
  current_game.pocket([1,2])
  redirect '/'
end

get '/roll' do
  current_game.roll
  redirect '/'
end

def current_game
  session_start! unless session?
  session["game"] = Game.new.start unless session["game"]

  session["game"]
end