require 'byebug'
get '/questions/:id' do
	@question = Question.find_by_id(params[:id])
	if @question != nil
		@asker = User.find_by_id(@question.user_id)

		@helper = []

		@answers = Answer.where(question_id: params[:id])

		if @answers.first != nil
			@answers.each do |answer|
				@helper << User.find(answer.user_id)
			end
		end

		#Voting system for questions
		@votesq = QuestionVote.where(question_id: params[:id])
		if @votesq.first == nil
			@countq = 0
		else
			@countq = 0
			@votesq.each do |vote|
				@countq += vote.vote_type
			end

			@votedq = QuestionVote.where(user_id: session[:user_id]).where(question_id: params[:id]).first
		end

		erb :"static/answer"
	else
		redirect '/'
	end
end

post '/:id/addanswer' do
	answer = Answer.new(description: params[:answer][:description], user_id: session[:user_id], question_id: params[:id])
	answer.save
	redirect "/questions/#{answer.question_id}"
end

get '/answers/:id/edita' do
	@answer = Answer.find(params[:id])
	if current_user.id == @answer.user_id.to_i
		erb :"static/edit_answer"
	else
		redirect '/'
	end
end

put '/answers/:id/updatea' do
	answer = Answer.find(params[:id])
	answer.update(description: params[:answer][:description])
	redirect "/questions/#{answer.question_id}"
end

post '/answers/:id/deletea' do
	answer = Answer.find(params[:id])
	answer.destroy
	redirect "/questions/#{answer.question_id}"
end