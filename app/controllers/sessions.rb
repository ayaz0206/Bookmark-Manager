get '/sessions/new' do
	erb :"sessions/new", :layout => !request.xhr?
end

post '/sessions' do
	email, password = params[:email], params[:password]
	user = User.authenticate(email, password)
	if user
		session[:user_id] = user.id
		redirect to ('/')
	else
		flash[:errors] = ["The email or password is incorrect"]
		erb :"sessions/new", :layout => !request.xhr?
	end
end

delete '/sessions' do
	flash[:notice] = "Good bye!"
	session[:user_id] = nil
	erb :"sessions/new", :layout => !request.xhr?
end
