class ApplicationController < ActionController::API
  include JsonWebTokenValidation::UserTokenValidation
  include JsonWebTokenValidation::AdminTokenValidation

  before_action :validate_json_web_token

end
