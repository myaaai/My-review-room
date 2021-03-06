class ApplicationController < ActionController::Base

  before_action :set_search
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :birth_date, :gender])
  end
  
  private
  
    def set_search
      @q = PostImage.ransack(params[:q])
      @items = @q.result(distinct: true)
    end
end
