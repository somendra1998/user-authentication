class Admin::AdminLoginsController < ApplicationController
  skip_before_action :validate_json_web_token

  def create
    begin
      admin_user = AdminUser.find_by_email(params[:email])
      if admin_user.authenticate(params[:password])
        token =  JsonWebToken::AdminToken.encode(admin_user.id, nil, 24.hours.from_now)
        render json: {token: token}, status: :ok
      else
        render json:{error: 'unauthorized'}, status: :unauthorized
      end
    rescue => exception
      render json: { error: "It seems you are not registered" }
    end
  end

end
