# frozen_string_literal: true

class Api::WeatherController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user

  rescue_from ActiveRecord::RecordNotFound, with: :no_user

  def update
    weather = Weather.find_or_initialize_by(zipcode: @user.zipcode)
    weather.update!(main: OpenWeather::Zip.call(@user.zipcode))
    render json: { message: "Weather on #{@user.zipcode} updated." }
  end

  private

  def set_user
    @user = User.find_by!(macaddr: Macaddr::Self.call)
  end

  def no_user
    render json: { message: 'No such user. Please signup from WebUI to register zipcode.' }
  end
end
