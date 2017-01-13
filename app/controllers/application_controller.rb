class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
        admin_dashboard_path
    else
        root_path
    end
 end

  def authenticate_active_admin_user!
     authenticate_user!
     unless current_user.admin?
        flash[:alert] = "You are not authorized to access this resource!"
        redirect_to root_path
     end
  end


end
