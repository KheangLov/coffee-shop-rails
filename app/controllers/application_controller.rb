class ApplicationController < ActionController::Base
  include ApplicationHelper
  include DeviseHelper

  protect_from_forgery with: :exception

  protected
  
  def after_sign_in_path_for(resource)
    redirect_path = root_path
    if is_admin_superadmin?(current_user)
      redirect_path = admin_users_dashboard_path
    else
      redirect_path = my_users_dashboard_path
    end
    
    request.env['omniauth.origin'] || stored_location_for(resource) || redirect_path
  end
end
