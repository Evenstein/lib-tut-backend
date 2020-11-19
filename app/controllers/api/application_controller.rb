# frozen_string_literal: true

module API
  class ApplicationController < ActionController::API
    include Knock::Authenticable
    undef_method :current_user
  end
end
