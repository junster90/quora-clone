require 'byebug'
get '/questions/:id' do

	@question = Question.find_by_id(params[:id])
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
end
