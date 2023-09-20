# Registration controller to manage registration of users
class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionFixController
  before_action :configure_sign_up_params, only: [:create]

  protected

  # Add name to devise sanitizer (Overriding default).
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  # Json response on registration or deletion
  def respond_with(current_user, _opts = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up successfully.' },
        data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      }, status: :ok
    elsif resource.destroyed?
      render json: { code: 200, message: 'User deleted' }, status: :ok
    else
      render json: {
        status: {
          code: 400, message: "User couldn't be created successfully.",
          error: "#{current_user.errors.full_messages.to_sentence}"
          }
      }, status: :bad_request
    end
  end
end
