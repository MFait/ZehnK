require 'sinatra'

configure do
	enable :sessions
  set :secret_key, 'mze32!@34&*ghwKWG09BSv±~a98jbnb'
end

before do
	content_type :txt
end

get '/set' do
session[:time] = Time.now

"Session is set to #{session[:time]}"
end

get '/fetch' do
	"Session data is = #{session[:time]}"
end

get '/clear' do
  session.clear
end
