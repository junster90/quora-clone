class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :description, :question_id, :user_id, presence: true

	belongs_to :user
	belongs_to :question
	has_many :answer_votes, dependent: :destroy
end
