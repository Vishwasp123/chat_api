class Api::MessagesController < ApplicationController
  before_action :set_message, only: [:show, :destroy, :update] 

  def index
    @messages = Message.all 
    render json: @messages
  end

  def show
  	
    render json: @message
  end

  def create
  	# binding.pry
    @message = Message.new(messages_params)
    if @message.save
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def update
    if @message.update(messages_params)
      render json: @message
    else 
      render json: @message.errors, status: :unprocessable_entity 
    end
  end

  def destroy
    @message.destroy
    head :no_content
  end

  private 
  
  def messages_params
    params.require(:message).permit(:text, :chat_id, :user_id)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
