require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require 'sinatra/flash'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require './models'

enable :sessions

set :database, {adapter: 'sqlite3', database: 'micro.sqlite3'}

#Configure Carrierwave
CarrierWave.configure do |config|
  config.root = File.dirname(__FILE__) + "/public"
end

def current_user
	@current_user = User.find(session[:username])if session[:username]
end

before do
	current_user
end

#login protection
before ['/newpost','/profile'] do
	redirect '/' unless @current_user
end

get '/' do
	erb :home
end

get '/login' do
	erb :login
end

get '/signup' do
	erb :signup
end

get '/profile' do
	# @posts = Post.all
	erb :profile
end

#handle login
post '/login' do
	@user = User.find_by(username: params[:username])
	p @user, params 
	if @user && @user.password == params[:password]
		session[:username] = @user.id
		flash[:message] = "Welcome, nerd."
		redirect '/profile'
	else
		flash[:message] = "Ooops, did you forget your account information?  I don't recognize that user/pass combo, you nerd."
		redirect back
	end
end

post '/profile' do
	accepted_keys = %w(title body type calories)	
	post = Post.new params.select{|k| accepted_keys.include? k}
	post.save
	redirect '/profile'
end

