require 'byebug'

post '/:idq/upvotea/:ida' do
	vote = AnswerVote.new(vote_type: 1, answer_id: params[:ida], user_id: session[:user_id])
	vote.save
	redirect "/questions/#{params[:idq]}"
end

post '/:idq/downvotea/:ida' do
	vote = AnswerVote.new(vote_type: -1, answer_id: params[:ida], user_id: session[:user_id])
	vote.save
	redirect "/questions/#{params[:idq]}"
end