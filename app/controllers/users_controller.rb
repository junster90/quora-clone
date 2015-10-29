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
	redirect to '/'
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

	erb :"/static/user"
end

get '/users/:id/questions' do
	
	@user = User.find_by_id(params[:id])

	if @user == nil
		@message = "User not found"
	else
		@message = "Name: #{@user.full_name}"
	end

	@questions = Question.where(user_id: params[:id])

	@no_question = "This user hasn't asked any questions."

	erb :"/static/user_questions"
end

get '/users/:id/answers' do
	
	@user = User.find_by_id(params[:id])

	if @user == nil
		@message = "User not found"
	else
		@message = "Name: #{@user.full_name}"
	end

	@answers = Answer.where(user_id: params[:id])

	@no_answer = "This user hasn't answered any questions."
	
	erb :"/static/user_answers"
end