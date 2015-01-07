class SessionsController < ApplicationController
	
	def new
  	end
  	
  	def create
  	end
  	
  	def destroy
		session[:user_id] = nil
		flash[:notice] = "You've been logged out successfully."
		redirect_to "/"
	end

end