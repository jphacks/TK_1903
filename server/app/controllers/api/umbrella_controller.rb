# frozen_string_literal: true

class Api::UmbrellaController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    user = User.find_by(macaddr: Macaddr::Self.call)
    user.update!(update_params)
    render json: { response: 'ok' }, status: :ok
  end

  private

  def update_params
    {
      umbrella1: params[:umbrella1],
      umbrella2: params[:umbrella2]
    }
  end
end
