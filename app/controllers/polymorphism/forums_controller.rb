class Polymorphism::ForumsController < ApplicationController
	before_action :set_forum, only: %i[ show update destroy ]

	def index
		@forums = Forum.all 

		render json: @forums 
	end

	def show 
		render json: @forum 
	end

	def create
		@forum = Forum.create(forum_params)
		if @forum.save 
			render json: {messages: "Forum create", forum: @forum }, status: :ok 
		else 
			render json: @forum.errors, status: :unprocessable_entity
		end
	end

	def update
		if @forum.update(forum_params)
			render json: {messages: "Forum update", forum: @forum }, status: :ok  
		else 
			render json: @forum.errors, status: :unprocessable_entity
		end
	end

	def destory
		@forum.destroy
	end

	private

	def set_forum
		params.require(:forum).permit(:title)
	end

	def forum_params
		@forum = Forum.find(params[:id])
	end
end
