module JsonWebTokenValidation
  module AdminTokenValidation

    def validate_json_web_token
      header = request.headers["token"]
      header = header.split(" ").last if header
      @token = JsonWebToken::AdminToken.decode(header)
      @current_user = AdminUser.find(@token[:id])
    end

  end
end
