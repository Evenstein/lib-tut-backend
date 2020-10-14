# frozen_string_literal: true

module Validations
  module Users
    extend ActiveSupport::Concern
    EMAIL_REGEX = /\A(?!.{129})[^\s@]+@[^\s@]+\.[^\s@]{2,}\z/.freeze
    PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,64}\z/.freeze

    included do
      with_options on: '/registration' do
        validates :email,
                  format: { with: EMAIL_REGEX, message: 'Invalid email format' },
                  uniqueness: {
                      case_sensitive: false, message: 'Email already taken'
                  }
        validates :password,
                  confirmation: { case_sensitive: true, message: 'Does not match passwords' },
                  format: { with: PASSWORD_REGEX, message: 'Invalid password format' },
                  length: { in: 8..64, message: 'Invalid password length' }
        validates :password_confirmation, presence: true
      end
    end
  end
end
