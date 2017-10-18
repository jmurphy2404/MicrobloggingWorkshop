require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require './models'
require 'sinatra/flash'

set :database, {adapter: 'sqlite3', database: 'micro.sqlite3'}

# before do
# 	current_user
# end

# #login protection
# before ['/questions/new','/questions'] do
# 	redirect '/' unless @current_user
# end

get '/' do
	erb :home
end
