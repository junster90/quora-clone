get '/' do
	@questions = Question.all

	erb :"static/index"
end

post '/ask' do
	erb :"static/ask"
end