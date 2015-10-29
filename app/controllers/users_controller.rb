require 'byebug'

enable :sessions

get '/hello' do
	erb :"static/hello"

end

post '/signup' do
	@user = User.new(params[:user])
	if @user.save
		@message = "Thank you for signing up! You may now login."
	else
		@user.error

  	erb :"static/index"
  end
end

post '/login' do
	@user = User.authenticate(params[:user][:email], params[:user][:password])
	session[:user_id] = @user.id
	@message = "Welcome #{@user.full_name}! Thank you for logging in."
	redirect to 'users/:id'
end

post '/logout' do
	session[:user_id] = nil
	redirect to '/'
end

get '/users/:id' do
	
	@user = User.find_by_id(params[:id])

	if @user == nil
		@message = "User not found"
	else
		@message = "Name: #{@user.full_name}"
	end
end