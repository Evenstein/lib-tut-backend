# frozen_string_literal: true

module API
  class ApplicationController < ActionController::API
    include Knock::Authenticable
    undef_method :current_user
    # Custom error subclasses
    class AuthenticationError < StandardError; end

    class MissingToken < StandardError; end

    rescue_from AuthenticationError, with: :unauthorized_request
    rescue_from MissingToken, with: :unauthorized_request

    private

    def unauthorized_request
      render json: { errors: I18n.t('api.errors.unauthorized_request') },
             status: :unauthorized
    end
  end
end
