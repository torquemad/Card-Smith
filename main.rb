require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'
require 'bcrypt'

enable :sessions

require_relative 'config'
require_relative 'card'
require_relative 'user'

after do
  ActiveRecord::Base.connection.close
end

# USER AUTHENTICATION
get '/session/new' do
  erb :login
end

helpers do
  def logged_in?
    !!current_user #trick to return boolean  
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end


# LOGIN 
post '/session' do

  @user = User.find_by(email: params[:email]) 

  if params[:login] == 'signup'   

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/'
    else 
      if @user && !@user.authenticate(params[:password])
        erb :login
      else
        @createUser = User.create(email: params[:email], password: params[:password], username: params[:username])

        @createUser.authenticate(@createUser.password)
        session[:user_id] = @createUser.id
        redirect to '/'
      end
    end

  elsif params[:login] == 'login'
    
    if
      @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      # correct password
      redirect to '/'
    else 
      # incorrect email or password
      erb :login
    end

  end

end


#destroy the session on logout
delete '/session' do
  session[:user_id] = nil
  redirect to '/'
end


# =======================
get '/' do
  @card = Card.all
  erb :index
end

get '/my_cards' do

  if current_user

  @card = Card.where(:user_id => current_user.id)
  erb :user_cards

 else
  erb :login
 end
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
  # redirect to '/session/new' unless current_user



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
  card.user_id = current_user.id
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

  binding.pry
  redirect to '/'

end

# delete an existing card
delete '/card/:id/delete' do
  card = Card.find(params[:id])
  card.delete

  redirect to '/my_cards'
end

# view a specific card
get '/card/:id/view' do
  @card = Card.find(params[:id])

  erb :view_card
end