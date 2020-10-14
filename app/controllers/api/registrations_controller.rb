# frozen_string_literal: true

class API::RegistrationsController < API::ApplicationController
  def create
    context = Interactors::Users::CreateUser.call(user_params)

    if context.status == :created
      render json: { message: context.message }, status: context.status
    elsif context.status == :conflict
      render json: { message: context.fields_errors }, status: context.status
    else
      render json: { message: 'Unprocessable data' }, status: 422
    end
  end

  private

  def user_params
    params.permit(
        :email,
        :password,
        :password_confirmation,
        :format
    )
  end
end
