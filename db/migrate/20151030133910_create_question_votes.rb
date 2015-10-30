class CreateQuestionVotes < ActiveRecord::Migration
	def change
		create_table :question_votes do |t|
			t.integer :vote_type
			t.string :question_id
			t.string :user_id

			t.timestamps null:false
		end
	end
end
