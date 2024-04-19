class HasManyThrough::PatientsController < ApplicationController
	before_action :set_patients, only: [:show, :destroy, :update]

	def index
		@patients = Patient.all
		render json: @patients
	end

	def show 
		render json:  @patient
	end

	def create
		@patient = Patient.create(patient_params)
		if @patient.save 
			render json: @patient, status: 200 
		else 
			render json: @patient.errors, status: :unprocessable_entity
		end
	end

	def update
		if @patient.update(patient_params)
			render json: @patient
		else
			render json: @patient.errors, status: :unprocessable_entity
	 end 
	end

	def destroy
		@patient.destroy
	end

	private


	def patient_params
		params.require(:patient).permit(:name)
	end

	def  set_patients
		@patient = Patient.find(params[:id])
	end
	
end
