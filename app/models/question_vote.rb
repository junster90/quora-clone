class QuestionVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :vote_type, :user_id, :question_id, presence: true
	validates :user_id, uniqueness: {scope: :question_id, message: "you may only vote once!"}
	belongs_to :user
end
