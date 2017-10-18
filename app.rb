require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require './models'
require 'sinatra/flash'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

enable :sessions

set :database, {adapter: 'sqlite3', database: 'micro.sqlite3'}

# before do
# 	current_user
# end

<<<<<<< HEAD
# #login protection
# before ['/questions/new','/questions'] do
# 	redirect '/' unless @current_user
# end
=======
#login protection
before ['/newpost','/profile'] do
	redirect '/' unless @current_user
end
>>>>>>> c1b945db4b855f78eb38032720ade5126ebc5e51

get '/' do
	erb :home
end

get '/profile' do
	@posts = Post.all
	erb :profile
end

#handle login
post '/login' do
	user = User.find_by(user_id: params[:user_id])
	p user, params 
	if user && user.password == params[:password]
		session[:user_id] = user.id
		flash[:message] = "Welcome, nerd."
		redirect '/'
	else
		flash[:message] = "Ooops, did you forget your account information?  I don't recognize that user/pass combo, you nerd."
		redirect back
	end
end

def current_user
	@current_user = User.find(session[:user_id])if session[:user_id]
end

post '/profile' do
	accepted_keys = %w(title body type calories)	
	post = Post.new params.select{|k| accepted_keys.include? k}
	post.save
	redirect '/profile'
end