# frozen_string_literal: true

class ConfirmationsController < Devise::ConfirmationsController

  private

  def after_confirmation_path_for(resource_name, resource)
    url_options = Rails.application.config_for(:urls)[:frontend]
    redirect_url = URI::Generic.build(
                     host: url_options[:host],
                     scheme: url_options[:protocol],
                     port: url_options[:port],
                   ).to_s

    url_for(redirect_url)
  end
end
