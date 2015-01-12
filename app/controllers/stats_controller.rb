class StatsController < ApplicationController
	def index
		unless current_user.nil?
      		@trainings = Training.where(:user_id => current_user.id).order('date DESC')
      		render json: @trainings
    	else
      		redirect_to '/log-in/'
    	end
	end
end
