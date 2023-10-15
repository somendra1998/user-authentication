class AuthenticationController < ApplicationController
  skip_before_action :validate_json_web_token

  def login
    @user = User.find_by_email(params[:email])
    if @user.authenticate(params[:password])
      token =  JsonWebToken::UserToken.encode(@user.id, nil, 24.hours.from_now)
      render json: {token: token}, status: :ok
    else
      render json:{error: 'unauthorized'}, status: :unauthorized
    end
  end
end
