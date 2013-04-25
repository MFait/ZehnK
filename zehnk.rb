require 'sinatra'
require 'haml'
require 'sinatra/session'
require './helpers/view_helpers'

Dir['./lib/*.rb'].each { |file| require file }

set :session_secret, 'So0perSeKr3t!'

get '/' do
  haml :index, :locals => { :game => current_game}
end

get '/reset' do
  session.clear if session?
  redirect '/'
end

post '/take' do
  current_game.pocket(keys_as_integers(params['dices']))
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

def current_game
  session_start! unless session?
  session["game"] = Game.new.start unless session["game"]

  session["game"]
end

def keys_as_integers(params)
  return [] if params.nil?
  params.keys.map { |v| v.to_i }
end
