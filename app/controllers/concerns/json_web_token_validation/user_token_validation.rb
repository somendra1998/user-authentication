module JsonWebTokenValidation
  module UserTokenValidation

    def validate_json_web_token
      header = request.headers["token"]
      header = header.split(" ").last if header
      @token = JsonWebToken::UserToken.decode(header)
      @current_user = User.find(@token[:id])
    end

  end
end
