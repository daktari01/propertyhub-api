class ApplicationController < ActionController::API
  before_action :configure_permitted_params, if: :devise_controller?
  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '422',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :unprocessable_entity
  end

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :username, :first_name, :last_name, :image_url, :phone)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :username, :first_name, :last_name, :image_url, :phone, :current_password)
    end
  end
end
