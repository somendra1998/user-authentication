module JsonWebToken
  extend ActiveSupport::Concern

  def jwt_encode(id, data, expiration = nil)
    data ||= {}
    expiration ||= 7.days.from_now
    # payload[:expiration] = expiration.to_i
    payload = build_payload_for(id.to_i, data, expiration.to_i)
    JWT.encode(payload, secret_key)
  end

  def jwt_decode(token)
    @token = JWT.decode(token, secret_key)[0]
    HashWithIndifferentAccess.new @token
  end

  def secret_key
    Rails.application.secret_key_base
  end

  def build_payload_for(id, data, expiration)
    {
      id: id,
      expiration: expiration
    }.merge(data)
  end
end
