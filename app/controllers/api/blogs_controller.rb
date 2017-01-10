class Api::BlogsController < ApiBaseController
	skip_before_filter :verify_authenticity_token, :only => [:create, :update]
	def index
			@blogs= @user.blogs
		respond_with @blogs
	end
	def show
		@blog= Blog.find(params[:id])
		respond_with @blog
	end
	def create
		@blog= Blog.new(blog_permit)
		@blog.user= @user
		@blog.save!
		respond_with @blog
	end

	private
	def blog_permit
		params.require(:blog).permit!

	end
	
end
