class Polymorphism::EventsController < ApplicationController
	before_action :set_event, only: %i[ show update destroy ]

	def index 
		@events = Event.all 

		render json: @events
	end

	def show 
		render json:  @event
	end

	def create 
		@event = Event.create(event_params)
		if @event.save 
			render json: {messages: "Create event", event: @event } , status: :ok
		else 
			render json: @event.errors, status: :unprocessable_entity
		end
	end

	def update 
		if @events.update(event_params)
			render json: {messages: "Update event", event: @event }, status: :ok
		else 
			render json: @event.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@event.destroy
	end

	private 

	def set_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:title)
	end
end
