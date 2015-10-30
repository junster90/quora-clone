require 'byebug'

get '/' do
	@questions = Question.all

	erb :"static/index"
end

post '/ask' do
	if session[:user_id] == nil
		redirect to '/hello'
	else
		erb :"static/ask"
	end
end

get '/ask' do
	if session[:user_id] == nil
		redirect to '/hello'
	else
		erb :"static/ask"
	end
end

post '/addquestion' do
	new_q = Question.new(title: params[:question][:title], description: params[:question][:description], user_id: session[:user_id])
	new_q.save
	redirect "/questions/#{new_q.id}"
end