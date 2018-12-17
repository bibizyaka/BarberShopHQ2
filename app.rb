#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db" #connect to db syntax via active record

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

before do 

   @barbers = Barber.all
end

get '/' do
    #@barbers = Barber.all
    @barbers = Barber.order "created_at DESC"
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do

	@username = params[:username]
	@phone    = params[:phone]
	@datetime = params[:datetime]
	@barber   = params[:barber]
	@color    = params[:color]

	if @username == ""
	   @error = "Provide your name..."
	   erb:visit
    elsif @phone == ""
       @error = "Provide your phone..."
	   erb:visit
    elsif @datetime == ""
	   @error = "Provide your schedule..."
	   erb:visit
    else # data valid, input to DB
       Client.find_or_create_by(name: @username, phone: @phone, datestamp: @datetime, barber: @barber, color: @color )
       erb "<h2>Thank You, you signed up</h2>"
	end


end# post visit

get '/contacts' do

   erb :contacts

end

post '/contacts' do

	@email    = params[:email]
	@comments = params[:comments]

	if @email == ""
	   @error = "Provide your email..."
	   erb :contacts
    elsif @comments == ""
       @error = "Provide your comments..."
	   erb :contancts
    else # data valid, input to DB
       Contact.find_or_create_by(email: @email, comments: @comments )
       erb "<h2>Thank You, your comments have been submited!</h2>"
	end



end #post contancts


