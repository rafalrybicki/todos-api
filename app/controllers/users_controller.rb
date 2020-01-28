class UsersController < ApplicationController
  # POST /signup
  # return authenticated token upon signup
  skip_before_action :authorize_request, only: :create # :authorize_request - before_action in application_controller
  def create
    user = User.create!(user_params)
    # We use Active Record's create! method so that in the event there's an error, an exception will be raised and handled in the exception handler.
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
