class Polymorphism::PostsController < ApplicationController
	before_action :set_post, only: %i[ show update destroy ]

	def index 
		@posts = Post.all 
		render json: @posts 
	end

	def show 
		render json: @post 
	end

	def create
		@post = Post.create(posts_params)
		if @post.save 
			render json: { messages: "Post crate", post: @post }  , status: :ok
		else 
			render json: @post.errors, status: :unprocessable_entity
		end
	end

	def update 
		if @post.update(posts_params)
			render json: {messages: "posts update", post: @post } , status: :ok 
		else 
			render json: @post.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@post.destroy
	end

	private

	def posts_params
		@post = Post.find(params[:id])
	end

	def set_post
		params.require(:post).permit(:title) 
	end
end
