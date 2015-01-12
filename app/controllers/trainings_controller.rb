class TrainingsController < ApplicationController
	def index
    unless current_user.nil?
      @trainings = Training.where(:user_id => current_user.id)
      #@uniq_trainings = Training.where(:user_id => current_user.id).group("name")
      @trainings_g = Training.where(:user_id => current_user.id).order('date DESC')
    else
      redirect_to '/log-in/'
    end
	end

	def show
    	@training = Training.find(params[:id])
	end

	def new
    unless current_user.nil?
      @training = Training.new
      @user_id = current_user.id
      @uniq_trainings = Training.where(:user_id => current_user.id).group("name")
    else
      redirect_to '/log-in/'
    end
	end

	def edit
  		@training = Training.find(params[:id])
	end

	def create
      training_params.inspect
  		@training = Training.new(training_params)
  		if @training.save
  			redirect_to @training
  		else
  			render 'new'
  		end
	end

	def update
  		@training = Training.find(params[:id])
  		if @training.update(training_params)
    		redirect_to @training
  		else
    		render 'edit'
  		end
  end
 
  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    redirect_to 'trainings'
  end

	private

  		def training_params
    		params.require(:training).permit(:name, :date, :weight, :user_id)
  		end

end
