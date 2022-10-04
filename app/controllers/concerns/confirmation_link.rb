# frozen_string_literal: true

module ConfirmationLink
  SALT = ENV['JWT_SALT'].freeze
  APP_URL = ENV['APPLICATION_PATH'].freeze

  module_function

  def generate_link(email)
    return if email.nil?

    token = Base64.urlsafe_encode64(JWT.encode({ email: }, SALT))
    url = "#{APP_URL}congratulations/#{token}"
    {
      url:,
      token:
    }
  end

  def decode(token, verification = true)
    salt = verification ? SALT : nil

    JWT.decode(Base64.urlsafe_decode64(token), salt, verification)[0]
  rescue StandardError
    nil
  end
end
