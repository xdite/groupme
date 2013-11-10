class ApplicationController < ActionController::Base
  protect_from_forgery


  before_filter :configure_permitted_parameters, if: :devise_controller?

  def login_required
    if current_user.blank?
      respond_to do |format|
        format.html  {
          authenticate_user!
        }
        format.js{
          render :partial => "common/not_logined"
        }
        format.all {
          head(:unauthorized)
        }
      end
    end

  end


  def require_is_admin
    unless (current_user && current_user.admin?)
      redirect_to root_path, :flash => { :error => "no permission" }
    end
  end
  

  protected



  def configure_permitted_parameters 
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password,:password_confirmation)} 
  end


end
