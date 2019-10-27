# frozen_string_literal: true

class Api::ExistenceController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user

  rescue_from ActiveRecord::RecordNotFound, with: :no_user

  def update
    if params[:exist].to_i.zero?
      turnoff_leds
    else
      show_weather(@user.zipcode)
      show_neighbor(@user.zipcode)
    end

    render json: { message: 'OK' }, status: :ok
  end

  private

  def set_user
    @user = User.find_by!(macaddr: Macaddr::Self.call)
  end

  def no_user
    render json: { message: 'No such user. Please signup from WebUI to register zipcode.' }
  end

  def show_weather(zipcode)
    weather = Weather.find_by(zipcode: zipcode)
    if weather.main == 'Rain'
      `gpio write #{Rails.application.credentials.gpio[:blue]} 1`
    else
      `gpio write #{Rails.application.credentials.gpio[:red]} 1`
    end
  end

  def calc_unbring_umbrella(zipcode)
    all_users = User.where(zipcode: zipcode).count
    collected = User.where(zipcode: zipcode, umbrella1: true).or(User.where(zipcode: zipcode, umbrella2: true)).count
    percentage = ((collected.to_f / all_users) * 100).floor
    case percentage
    when  0 <= percentage && percentage < 10 then 5
    when 10 <= percentage && percentage < 20 then 4
    when 20 <= percentage && percentage < 40 then 3
    when 40 <= percentage && percentage < 60 then 2
    when 60 <= percentage && percentage < 80 then 1
    else 0
    end
  end

  def show_neighbor(zipcode)
    calc_unbring_umbrella(zipcode).times do |i|
      `gpio write #{Rails.application.credentials.gpio[:indicater][i]} 1`
    end
  end

  def turnoff_leds
    `gpio write #{Rails.application.credentials.gpio[:blue]} 0`
    `gpio write #{Rails.application.credentials.gpio[:red]} 0`
    `gpio write #{Rails.application.credentials.gpio[:indicater][0]} 0`
    `gpio write #{Rails.application.credentials.gpio[:indicater][1]} 0`
    `gpio write #{Rails.application.credentials.gpio[:indicater][2]} 0`
    `gpio write #{Rails.application.credentials.gpio[:indicater][3]} 0`
    `gpio write #{Rails.application.credentials.gpio[:indicater][4]} 0`
  end
end
