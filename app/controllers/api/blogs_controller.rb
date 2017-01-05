class Api::BlogsController < ApiBaseController
	skip_before_filter :verify_authenticity_token, :only => [:create, :update]
	before_filter :set_user
	def index
		if params[:tag]
			@blogs = @user.Blog.tagged_with(params[:tag])
		else
			@blogs= @user.blogs.where(active: true)
		end

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
	def set_user
      @user= current_user
	end
end