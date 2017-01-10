class Api::UsersController < ApiBaseController

	def show
		respond_with @user
	end


end
