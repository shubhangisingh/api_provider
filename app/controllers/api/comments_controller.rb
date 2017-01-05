class Api::CommentsController < ApiBaseController

  skip_before_filter :verify_authenticity_token, :only => [:create, :update]
  before_action :set_blog

	def index
		comments=@blog.comments
		respond_with comments
	end
	def create
		comment= @blog.comments.new(comment_permit)
		comment.save!
		respond_with comment
	end

	private
	def comment_permit
		params.require(:comment).permit!

	end

	def set_blog
		@blog= Blog.find(params[:blog_id])
	end

end
