class AnswerVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :vote_type, :user_id, :answer_id, presence: true
	validates :user_id, uniqueness: {scope: :answer_id, message: "you may only vote once!"}

	belongs_to :user
end
