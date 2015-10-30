class CreateAnswerVotes < ActiveRecord::Migration
	def change
		create_table :answer_votes do |t|
			t.integer :vote_type
			t.string :answer_id
			t.string :user_id

			t.timestamps null:false
	end
end
