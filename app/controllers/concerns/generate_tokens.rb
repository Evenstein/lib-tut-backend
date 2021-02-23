# frozen_string_literal: true

module GenerateTokens
  extend ActiveSupport::Concern
  def generate_tokens(user, device_uid = nil)
    tokens = Interactors::Users::GenerateTokens.call(
      user: user,
      device_uid: device_uid
    )

    if user.confirmed?
      render_tokens(tokens)
    else
      render json: { message: 'Generation failed' }, status: :forbidden
    end
  end

  def render_tokens(tokens)
    if tokens.token.present?
      render json: { jwt: tokens.token, refresh_token: tokens.refresh_token }, status: :created
    else
      render json: { message: 'Invalid data' },
             status: :unauthorized
    end
  end
end
