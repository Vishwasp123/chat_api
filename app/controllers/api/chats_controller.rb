class Api::ChatsController < ApplicationController
	before_action :set_chat, only: %i[ show update destroy]
	
	def index 
		@chats = Chat.all 
		render json: @chats
	end

	def show 
		render json: @chat
	end

	def create 
		@chat = Chat.new(chat_params)
		if @chat.save  
			render json: @chat, status: :created
		else 
			render json: @chat.errors, status: :unprocessable_entity
		end
	end

	def update  
		if @chat.update(chat_params)
			render json: @chat 
		else 
			render json: @chat.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@chat.destroy
	end

	private
	def set_chat
		@chat = Chat.find(params[:id])
	end
	def chat_params
		params.require(:chat).permit(:title)
	end
end
