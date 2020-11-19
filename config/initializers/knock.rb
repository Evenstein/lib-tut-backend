# frozen_string_literal: true

require 'knock/authenticable'

Knock.token_lifetime = Rails.application.credentials.jwt[:expiration_period][:token].days
Knock.token_secret_signature_key = -> { Rails.application.credentials.secret_key_base }
