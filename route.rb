require 'sinatra'
require 'require_all'
require_all './controllers'

get '/' do
    puts params
end

post '/users' do
    save_user(params) 
end

get '/posts/param' do
    
end

get '/tags' do
    get_all_tag()
end

