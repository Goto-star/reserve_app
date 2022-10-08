class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_q
  
  def search
    @results = @q.result
  end
  
  def show
    @user = current_user
  end
  
  def after_sign_in_path_for(resource)
    users_show_path
  end
  
  protected
  
  def set_q
    @q = Room.ransack(params[:q])
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction, :image])
  end
  
end
