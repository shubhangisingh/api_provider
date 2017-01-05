class Api::TagsController < ApiBaseController
	def index
		@tags= Tag.all
		@tags=@tags.map{|s| {:text => s.name, :counter => s.blog_count }}
		respond_with @tags
	end
	def autocomplete
		query= params[:query]
		@tags= Tag.where("name LIKE '%#{query}%'")
		@tags=@tags.map{|s| {:text => s.name }}
		respond_with @tags
	end

end
