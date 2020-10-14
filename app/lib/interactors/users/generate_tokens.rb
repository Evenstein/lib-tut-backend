# frozen_string_literal: true

module Interactors
  module Users
    class GenerateTokens < Base
      expects do
        required(:user).filled
      end

      promises do
        required(:refresh_token).filled
        required(:token).filled
      end

      def call
        context.refresh_token = generate_refresh_token.token
        context.token = generate_token
      end

      private

      def generate_refresh_token
        token =
            Knock::AuthToken.new(
                payload: {
                    sub: context.user.id,
                    exp: expiration_date&.to_i
                }
            ).token
        find_or_create_token(token)
      end

      def find_or_create_token(token)
        RefreshToken.where('expires_at > ?', DateTime.now)
            .find_or_create_by(
                user_id: context.user.id,
                device_uid: context.device_uid
            ) do |r|
          r.token = token
          r.expires_at = expiration_date
        end
      end

      def generate_token
        Knock::AuthToken.new(
            payload: {
                sub: context.user.refresh_tokens.find_by(device_uid: context.device_uid).id
            }
        ).token
      end

      def expiration_date
        @expiration_date ||= Rails.application.credentials
                                 .jwt[:expiration_period][:refresh_token]&.days&.from_now
      end
    end
  end
end
