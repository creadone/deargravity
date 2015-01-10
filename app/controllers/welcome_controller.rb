class WelcomeController < ApplicationController
  def index
  	unless current_user.nil?
  		redirect_to '/trainings/'
    end
  end
end
