class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  
  def after_sign_in_path_for(resource)
    if current_user.role? :student
      profile_student_path(current_user.user_account.id)
    else
      root_path 
    end
    
  end
  
  
  def has_role?(current_user, role)
    return !!current_user.roles.find_by_name(role.to_s.upcase)
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
