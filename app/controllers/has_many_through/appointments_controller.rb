class HasManyThrough::AppointmentsController < ApplicationController

	before_action :set_appointment, only: [:show, :update, :destroy]

	def index
		@appointments = Appointment.all 
		render json: @appointments
	end

	def show 
		render json: @appointment
	end

	def create
		@appointment = Appointment.create(appo_params)
		if @appointment.save 
			render json: @appointment
		else  
			render json: @appointment.errors, status: :unprocessable_entity
		end
	end

	def update
		@appointment = Appointment
		if @appointment.update(appo_params)
			render json: @appointment
		else 
			render json: @appointment, status: :unprocessable_entity
		end
	end

	def destroy
		@appointment.destroy
	end

	private 
	
	def set_appointment
		@appointment = Appointment.find(params[:id])
	end

	def appo_params
		params.require(:appointment).permit(:physician_id, :patient_id, :appointment_type, :appointment_date) 
	end
end
