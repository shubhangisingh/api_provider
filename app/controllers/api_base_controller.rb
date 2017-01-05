class ApiBaseController < ApplicationController
#  before_action :doorkeeper_authorize!
  before_action :authenticate_user!
  respond_to :json
  private

  # def current_user
  #
  #   current_user || = User.find(doorkeeper_token.resource_owner_id)
  # end

end
