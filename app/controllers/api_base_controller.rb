class ApiBaseController < ApplicationController
  before_action :doorkeeper_authorize!, :set_user
  respond_to :json
  private

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
  def set_user
      @user= current_resource_owner
	end
end
