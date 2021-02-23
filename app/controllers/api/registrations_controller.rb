# frozen_string_literal: true

class RegistrationsController < API::ApplicationController
  def create
    context = Interactors::Users::CreateUser.call(user_params)

    case context.status
    when :created
      render json: { message: context.message }, status: context.status
    when :conflict
      render json: { message: context.fields_errors }, status: context.status
    else
      render json: { message: 'Unprocessable data' }, status: :unprocessable_entity
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
