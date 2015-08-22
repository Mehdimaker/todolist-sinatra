require 'sinatra'
require 'sinatra/activerecord'

set :database,"sqlite3:todolist.sqlite3"

class Donnees <ActiveRecord::Base
end

get '/' do
    @data = Donnees.order('created_at DESC') 
    erb :index
end

post '/' do
    Donnees.create(params)
    redirect '/'
end

post '/delete' do
    Donnees.find(params[:id]).destroy
    redirect '/'
end

get '/edit/:id' do
    @edit = Donnees.find(params[:id])
    erb :edit
end
post '/edit/:id' do
    @edit = Donnees.find(params[:id])
    @edit.content = params[:content]
    @edit.save
    redirect '/'
end