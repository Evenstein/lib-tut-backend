# frozen_string_literal: true

class AuthTokensController < API::ApplicationController
  include GenerateTokens
  before_action :fetch_token_record, only: :update

  def create
    user_context = Interactors::Users::AuthenticateUser.call(auth_params)

    if user_context.user.present?
      generate_tokens(user_context.user, auth_params[:device_uid])
    else
      render json: { message: user_context.message }, status: user_context.status
    end
  end

  def update
    # Check refresh token expiration
    JWT.decode(@token_record.token, Rails.application.credentials.secret_key_base)
    raise(AuthenticationError) if @token_record.token != params[:refresh_token]

    render json: { jwt: tokens.token }, status: :ok
  end

  private

  def fetch_token_record
    raise(MissingToken, 'Token is missed') if token.blank?

    @token_record = RefreshToken.find(fetch_refresh_token_id)
  end

  def fetch_refresh_token_id
    JWT.decode(
      token,
      Rails.application.credentials.secret_key_base,
      true,
      verify_expiration: false
    ).first['sub']
  end

  def auth_params
    params.permit(
      :email,
      :password,
      :device_uid
    )
  end

  def tokens
    Interactors::Supporters::GenerateTokens.call(user: @token_record.user,
                                                 device_uid: @token_record.device_uid)
  end
end
