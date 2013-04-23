require 'sinatra'
require 'sinatra/session'
set :session_secret, 'So0perSeKr3t!'

get '/' do
  session_start!
  session["message"] = 'Hello World'
  "Saying #{session['message']}"
end

get '/killsession' do
  if session?
    session.clear
  end
end

get '/session' do
  session_start!
  "#{session['message']}"
end
