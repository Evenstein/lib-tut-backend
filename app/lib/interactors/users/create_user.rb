# frozen_string_literal: true

module Interactors
  module Users
    class CreateUser < Base
      expects do
        required(:email).filled
        required(:password).filled
        required(:password_confirmation).filled
      end

      def call
        context.email.downcase!
        context.user = register_user

        return if context.user.blank?

        context.message = 'Success'
        context.status = :created
      end

      private

      def register_user
        assign_user_params
        user.validate!('/registration')
        user.save(validate: false)

        user
      rescue ActiveRecord::RecordInvalid
        context.fail!(
          fields_errors: user.errors.values.flatten.delete_if { |e| e.start_with?(/[a-z]/) },
          status: :conflict
        )
      end

      def assign_user_params
        user.assign_attributes(
          password: context.password,
          password_confirmation: context.password_confirmation
        )
      end

      def user
        @user ||= User.new(email: context.email)
      end
    end
  end
end
