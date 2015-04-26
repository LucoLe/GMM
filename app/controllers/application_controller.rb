class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

    def after_sign_in_path_for(resource)
      if current_club_owner
        clubs_path
      else
        member_path(current_member.id)
      end
    end

    def configure_permitted_parameters
      if resource_name == :member
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :email,
                                       :password, :first_name, :last_name) }
      end
    end
end
