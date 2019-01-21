class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		@comment.user_id = current_user.id
		redirect_to post_path(@post)
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to post_path
	end

	private 
	def comment_params
		params.require(:comment).permit(:body)
	end

end
