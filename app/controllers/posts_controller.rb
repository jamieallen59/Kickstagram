class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title, :picture, :tags_list, :address, :price))
		@post.save
		redirect_to '/posts'
	end

	def show
		@post = Post.find(params[:id])
		render json: @post
	end

end
