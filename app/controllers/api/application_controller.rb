# frozen_string_literal: true

module API
  class ApplicationController < ActionController::API
    include Knock::Authenticable
  end
end
