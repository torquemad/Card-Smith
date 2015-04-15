require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'
require 'bcrypt'

enable :sessions
require_relative 'config'
require_relative 'card'

after do
  ActiveRecord::Base.connection.close
end

#before each request, load everything all categories from DB into instance var
before do 
  # @categories = Category.all
end


# USER AUTHENTICATION
get '/session/new' do
  erb :login
end

get '/' do
  @card = Card.all
  erb :index
end

get '/about' do
  erb :about
end

get '/cards' do
  @card = Card.all
  erb :index
end

# View form to make a card (get request)
get '/card/new' do
  erb :new
end

# Save that card to the database
post '/cards' do
  card = Card.new
  card.name = params[:creaturename]
  card.creatureclass = params[:creatureclass]
  card.planet = params[:planet]
  card.movement = params[:movement]
  card.artworkurl = params[:artworkurl]
  card.descriptionrules = params[:descriptionrules]
  card.descriptionflavor = params[:descriptionflavor]
  card.damage = params[:damage]
  card.health = params[:health]
  card.save

  if card.save
    redirect to '/'
  else
    erb :new
  end
end 

# edit an existing card

# get the existin card
get '/card/:id/edit' do
  @card = Card.find(params[:id])

  erb :edit
end

#Find the existing card db ID and save the changes
post '/card/:id' do

  card = Card.find(params[:id])
  card.name = params[:creaturename]
  card.creatureclass = params[:creatureclass]
  card.planet = params[:planet]
  card.movement = params[:movement]
  card.artworkurl = params[:artworkurl]
  card.descriptionrules = params[:descriptionrules]
  card.descriptionflavor = params[:descriptionflavor]
  card.damage = params[:damage]
  card.health = params[:health]
  card.save

  redirect to '/'

end

# delete an existing card

delete '/card/:id/delete' do
  "Hello World"
  card = Card.find(params[:id])
  card.delete

  redirect to '/'
end
