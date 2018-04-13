class PostsController < ApplicationController

	before_action :find_post, only: [:edit, :update, :show, :destroy]

	def index
		@posts = Post.all
	end

	def new 
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.valid?
			@post.save
			redirect_to post_path(@post)
		else
			render :new
		end
	end

	def edit
	
	end 

	def update
		@post = Post.find_by(params[:id])

		if @post.update(post_params)
			redirect_to post_path(@post)
		else
			render :edit
		end
	end

	def show
	
	end

	def destroy
		@post.destroy
    	redirect_to posts_path
	end

private

	def post_params
		params.require(:post).permit(:title, :body, category_ids:[],  categories_attributes: [:name])
	end

	def find_post
    	@post = Post.find(params[:id])
  	end



end
