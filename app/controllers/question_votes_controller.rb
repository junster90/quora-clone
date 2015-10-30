require 'byebug'

post '/:id/upvoteq' do
	vote = QuestionVote.new(vote_type: 1, question_id: params[:id], user_id: session[:user_id])
	vote.save
	redirect "/questions/#{params[:id]}"
end

post '/:id/downvoteq' do
	vote = QuestionVote.new(vote_type: -1, question_id: params[:id], user_id: session[:user_id])
	vote.save
	redirect "/questions/#{params[:id]}"
end