class PostsController < ApplicationController
	# before_action: authenticate_user!, only: [:index, :show]

	def index
		@posts = Post.all
		@user = current_user
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

	private def post_params
		params.require(:post).permit(:title,:desc,:body)
	end

end
