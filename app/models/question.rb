class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :title, :description, :user_id, presence: true

	has_many :answers, dependent: :destroy
	has_many :question_votes, dependent: :destroy
	belongs_to :user
end
