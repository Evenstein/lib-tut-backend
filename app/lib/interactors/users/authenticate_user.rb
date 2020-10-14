# frozen_string_literal: true

module Interactors
  module Users
    class AuthenticateUser < Base
      expects do
        required(:email).filled
        required(:password).filled
      end

      promises do
        required(:user).filled
      end

      def call
        user = verify_user
        if user.present?
          context.user = user
        else
          context.fail!(message: 'Invalid data',
                        status: :unauthorized)
        end
      end

      private

      # Verify supporter credentials
      def verify_user
        user = User.find_by(email: context.email&.downcase)
        user if user&.valid_password?(context.password)
      end
    end
  end
end
