# frozen_string_literal: true

class ConfirmationsController < Devise::ConfirmationsController

  private

  def after_confirmation_path_for(resource_name, resource)
    url_for('http://localhost:8080')
  end
end
