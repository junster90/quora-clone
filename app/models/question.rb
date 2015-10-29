class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :title, :description, :user_id, presence: true

	has_many :answers
	belongs_to :user
end
