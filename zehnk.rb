require 'sinatra'
require 'haml'
require 'sinatra/session'
require './helpers/view_helpers'
require './models/player_model'
require "pry"
#binding.pry

Dir['./lib/*.rb'].each { |file| require file }

set :session_secret, 'So0perSeKr3t!'
set :database, "postgres://Kitaka@localhost/spike"

before do

end

get '/dummy' do
  player = PlayerModel.new(:name=>"Andrew Mukiza", :score=>1000)
  player.save()
  "Done!"
end

get '/all' do
  players = PlayerModel.all
  #binding.pry
end

get '/' do
  haml :index, :locals => { :game => current_game}
end


get '/reset' do
  session.clear if session?
  redirect '/'
end

post '/take' do
  begin
    current_game.pocket(keys_as_integers(params['dices']))
  rescue => e
    session["error"] = e.message
  end
  redirect '/'
end

get '/roll' do
  current_game.roll
  redirect '/'
end

get '/help' do
  haml :help
end

get '/team'do
  haml :team
end

get '/bank' do
  if current_game.can_bank?
    current_game.bank
  end
  redirect '/'
end

def current_game
  session_start! unless session?
  session["game"] = Game.new.start unless session["game"]

  session["game"]
end

def keys_as_integers(params)
  return [] if params.nil?
  params.keys.map { |v| v.to_i }
end
