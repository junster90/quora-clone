require 'byebug'
get '/questions/:id' do
	@question = Question.find_by_id(params[:id])
	if @question != nil
		@asker = User.find_by_id(@question.user_id)

		@answers = []
		@helper = []

		@answers << Answer.find_by(question_id: params[:id])

		if @answers.first != nil
			@answers.each do |answer|
				@helper << User.find_by_id(answer.user_id)
			end
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