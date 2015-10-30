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
	if logged_in? == false
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

get '/questions/:id/editq' do
	@question = Question.find(params[:id])
	if current_user.id == @question.user_id.to_i
		erb :"static/edit_question"
	else
		redirect '/'
	end
end

put '/questions/:id/updateq' do
	question = Question.find(params[:id])
	question.update(title: params[:question][:title], description: params[:question][:description])
	redirect "/questions/#{question.id}"
end

post '/questions/:id/deleteq' do
	question = Question.find(params[:id])
	question.destroy
	redirect "/"
end


