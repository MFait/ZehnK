require 'sinatra'
require 'sinatra/session'

get '/' do
  session_start!
  session["message"] = 'Hello World'
  "Saying #{session['message']}"
  
  session_end!
  "Ending the session"
  
  unless session?
    "No session"
  end
end

get '/killsession' do
  if session?
    session.clear
  end
end
