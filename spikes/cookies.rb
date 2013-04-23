require 'sinatra'

get '/setcookie' do
  response.set_cookie 'id', rand(1000)
  "<a href='/read'>Read Cookie</a>"
end

get '/read' do
  "#{request.cookies['id']}"
end

get '/delete' do
  response.delete_cookie 'id'
  "Cookie deleted"
end