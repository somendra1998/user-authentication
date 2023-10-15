class ApplicationController < ActionController::API
  include JsonWebTokenValidation::UserTokenValidation

  before_action :validate_json_web_token

end
