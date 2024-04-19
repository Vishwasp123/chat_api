class HasManyThrough::PhysiciansController < ApplicationController
	before_action :set_physician, only: [:show, :destroy, :update]

	def index
		@physicians = Physician.all 
		render json: @physicians
	end

	def show
		render json: @physician
	end

	def create
		@physician = Physician.create(physician_params)
		if @physician.save  
			render json: @physician, status: 200  
		else
			render json: @physician.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@physician.destroy
	end

	private

	def set_physician
		@physician = Physician.find(params[:id])
	end

	

	def physician_params
		params.require(:physician).permit(:name)
	end
	
end
