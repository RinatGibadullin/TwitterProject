class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show] # нужен логин на всех кроме индекс и шоу

	def index
		@user = current_user
		@posts = Post.all.order("created_at DESC") # для вывода всех постов
		# @posts = @user.posts.order("created_at DESC") # для вывода моих постов
	end

	def show
		@post = Post.find(params[:id])
		
	end

	def new
		# @post = Post.new
		@post = current_user.posts.build
	end

	def create
		# @post = Post.new(post_params)
		# @post.user_id = current_user.id

		@user = current_user
		@post = @user.posts.build(post_params)

		if @post.save
			redirect_to @post
		else
			render :new
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(post_params)
			redirect_to @post
		else
			render :edit
		end
	end



	private 
	def post_params
		params.require(:post).permit(:title,:desc,:body)
	end

end
